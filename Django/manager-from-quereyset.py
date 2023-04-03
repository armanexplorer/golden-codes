import inspect

class BaseManager:
    
    ...

    """add intended (public and not queryset only) queryset methods to the current manager
    
    ``_get_queryset_methods``: create some methods originated from the QuerySet class,
    then put them with their names as keys in a dictionary.
    
    ``from_queryset``: Create a new manager class using ``type`` with the base class of ``cls``
    (BaseManager) and pass the created dictoinary in `_get_queryset_methods` to be added to the
    created class
    """

    @classmethod
    def _get_queryset_methods(cls, queryset_class):
        def create_method(name, method):
            def manager_method(self, *args, **kwargs):
                # INFO: The ``self`` here will be refrenced to the created manager class to
                # be able to call ``get_queryset()`` JUST IN TIME (like lazy stuff) 
                return getattr(self.get_queryset(), name)(*args, **kwargs)
            manager_method.__name__ = method.__name__
            manager_method.__doc__ = method.__doc__
            return manager_method

        new_methods = {}
        for name, method in inspect.getmembers(queryset_class, predicate=inspect.isfunction):
            # Only copy missing methods.
            if hasattr(cls, name):
                continue
            # Only copy public methods or methods with the attribute `queryset_only=False`.
            queryset_only = getattr(method, 'queryset_only', None)
            if queryset_only or (queryset_only is None and name.startswith('_')):
                continue
            # Copy the method onto the manager.
            new_methods[name] = create_method(name, method)
        return new_methods

    @classmethod
    def from_queryset(cls, queryset_class, class_name=None):
        if class_name is None:
            class_name = '%sFrom%s' % (cls.__name__, queryset_class.__name__)
        return type(class_name, (cls,), {
            '_queryset_class': queryset_class,
            **cls._get_queryset_methods(queryset_class),
        })
        
    ...