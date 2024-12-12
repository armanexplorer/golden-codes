---
title: how to work with serializers
---

## ListSerializer and Child

[Good Link for Customizing](https://freedium.cfd/customizing-listserializer-in-django-rest-framework-3862b70906e3)

[List and Child](https://stackoverflow.com/questions/51489952/drf-listserializer-and-listfield)

### access and edit child using parent (Example)

To get and modify the serializer of a ListSerializer in Django REST Framework, you can follow these steps:

#### Access the child serializer

The ListSerializer has a `child` attribute that contains the serializer used for individual items. You can access it like this:

```python
child_serializer = list_serializer.child
```

#### Modify the child serializer

Once you have access to the child serializer, you can modify its attributes or methods as needed. For example:

```python
child_serializer.fields['new_field'] = serializers.CharField()
```

#### Custom ListSerializer class

For more control, you can create a custom ListSerializer class:

```python
class CustomListSerializer(serializers.ListSerializer):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        # Modify the child serializer here
        self.child.fields['new_field'] = serializers.CharField()

    def to_representation(self, data):
        # Customize the representation if needed
        return super().to_representation(data)

class YourModelSerializer(serializers.ModelSerializer):
    class Meta:
        model = YourModel
        fields = ['field1', 'field2']
        list_serializer_class = CustomListSerializer
```

#### Dynamically modify the serializer

If you need to modify the serializer dynamically, you can do so in your view:

```python
class YourView(APIView):
    def get_serializer(self, *args, **kwargs):
        serializer_class = YourModelSerializer
        kwargs['many'] = True
        serializer = serializer_class(*args, **kwargs)

        # Modify the child serializer
        serializer.child.fields['new_field'] = serializers.CharField()

        return serializer
```
