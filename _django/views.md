---
title: Views - Dispatcher
description: How can we manuplate request in dispatch (the very first place for the request in view)
---

class CustomLoginView(rest_auth_views.LoginView):
    def dispatch(self, *args, **kwargs):
        # sanitize username before running processes
        request = args[0]
        username = request.POST.get('username')

        if username:
            data_query_dict = request.POST
            new_data_query_dict = data_query_dict.copy()
            new_data_query_dict.setlist('username', [sanitize_username(data_query_dict['username'])])
            args[0].POST = new_data_query_dict

        return super().dispatch(*args, **kwargs)