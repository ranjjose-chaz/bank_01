from django.shortcuts import render
from django.http import HttpResponse
from django.http import JsonResponse
from django.core import serializers
from django.forms.models import model_to_dict

from polls.models import Banks
from polls.models import BankBranches

import requests
import os
import json
import jwt

def index(request):
    return HttpResponse("Hello, world. You're at the polls index.")


def validate_jwt(f):    
    def wrapper(*args, **kw):        
        token_header = args[0].META.get('HTTP_AUTHORIZATION')

        try:
            jwt.decode(token_header, 'secret', algorithms=['HS256'])
        except Exception as e:
            print(e)
            return JsonResponse({"message": "JWT token invalid"}, status=401)             
        return f(*args, **kw)      
    return wrapper

#@validate_jwt
def bank(request, id=None):
    if ifsc:

        try:
            bank = Banks.objects.get(id=id)
        except Banks.DoesNotExist:
            return JsonResponse({"message": "The item does not exist"}, status=404)            
        return JsonResponse(model_to_dict(bank))
        
    return JsonResponse() 


#@validate_jwt
def banks(request, ifsc=None):
    if ifsc:

        try:
            bank = BankBranches.objects.get(ifsc=ifsc)
        except BankBranches.DoesNotExist:
            return JsonResponse({"message": "The item does not exist"}, status=404)            
        return JsonResponse(model_to_dict(bank))
        
    return JsonResponse()    


@validate_jwt
def branches(request):
    bank_name = request.GET.get('bank_name')
    city = request.GET.get('city')
    limit = request.GET.get('limit')
    offset = request.GET.get('offset')
    if bank_name and city and limit and offset and limit.isdigit() and offset.isdigit() and int(limit) > 1:
        limit = int(limit)
        offset = int(offset)        
        branch_list = BankBranches.objects.filter(city=city, bank_name=bank_name).order_by('ifsc')[offset:(offset+limit)]
        if not branch_list:
            return JsonResponse({"message": "The item does not exist"}, status=404)    
        return JsonResponse([model_to_dict(branch) for branch in branch_list], safe=False)
    return JsonResponse({"message": "The request can't be processed"}, status=422)    
      
