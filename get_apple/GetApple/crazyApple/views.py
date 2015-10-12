from django.shortcuts import render
from django.views.generic import View

from controller.caculate import Caculater
from controller.apple_initior import AppleInitor
import random
from datetime import datetime
import math

from crazyApple.models import Users
from crazyApple.models import Finisher
# Create your views here.
globle_apple_number = 0


def get_client_ip(request):
    x_forwarded_for = request.META.get('HTTP_X_FORWARDED_FOR')
    if x_forwarded_for:
        ip = x_forwarded_for.split(',')[0]
    else:
        ip = request.META.get('REMOTE_ADDR')
    return ip


class AppleGetter(View):
    appleNum = 0
    caculator = Caculater()
    appleInitor = AppleInitor()
    apple_infor_list = []
    needed_apple = None
    submited_apple = None
    question_type = 0
    cacualated_ans = 0
    progress_value = 100

    def post(self, request):
        print 'get a post !!!'
        chosed_index = int(request.POST.get('if-chosed'))
        print 'chose id ==', chosed_index

        chosed_apple_colors = request.POST.getlist('apple-true')
        chosed_apple_color = int(chosed_apple_colors[chosed_index])

        chosed_apple_type = chosed_index + 3
        # is iphone3,4,5,6

        pros_value = int(request.POST.get('progress-value'))
        print 'progress value ', pros_value

        if AppleGetter.question_type == 1 and \
                chosed_apple_color == AppleGetter.needed_apple:
                    AppleGetter.appleNum += 1
                    AppleGetter.progress_value = self.update_progress(pros_value)
        else:
            if AppleGetter.question_type == 1:
                AppleGetter.progress_value = pros_value + 2
        # elif AppleGetter.question_type == 1:
            # AppleGetter.progress_value += 10

        if AppleGetter.question_type == 0 and \
                chosed_apple_type == AppleGetter.cacualated_ans:
                    AppleGetter.appleNum += chosed_apple_type
                    AppleGetter.progress_value = self.update_progress(pros_value)
        else:
            if AppleGetter.question_type == 0:
                AppleGetter.progress_value = pros_value + 2

        # elif AppleGetter.question_type == 0:
            # AppleGetter.progress_value += 10

        context = self.create_context()
        global globle_apple_number
        globle_apple_number = AppleGetter.appleNum

        return render(request, 'get_apple.dhtml', context)

    def update_progress(self, old_num):
        # progress_speed = 20
        progress_new_value = old_num + 10
        # AppleGetter.progress_value *= 1.2
        if progress_new_value >= 100:
            print 'change to 100'
            progress_new_value = 100
        return progress_new_value

    def update_num(self):
        if AppleGetter.question_type == 0:
            pass
        else:
            pass

    def get(self, request):
        try:
            last_activity = request.session['last']
            now = datetime.now()
            last_date = datetime.strptime(last_activity, '%Y-%m-%d %H:%M:%S.%f')
            if (now - last_date).seconds > 10:
                AppleGetter.appleNum = 0
                AppleGetter.progress_value = 100
                print 'new.....'
        except KeyError:
            pass

        try:
            ip = get_client_ip(request)
            user = Users(ip=ip)
            user.save()
        except Exception as e:
            print e

        context = self.create_context()
        request.session['last'] = str(datetime.now())
        return render(request, 'get_apple.dhtml', context)

    def build_infor_list(self, list_1, list_2):
        number = 3

        inforList = []
        for t, s in zip(list_1, list_2):
            inforDic = {}
            inforDic['show'] = s
            inforDic['true'] = t
            inforDic['number'] = number
            inforDic['right'] = False

            if AppleGetter.question_type == 0:
                if inforDic['number'] == AppleGetter.cacualated_ans:
                    inforDic['right'] = True
            else:
                if inforDic['true'] == AppleGetter.needed_apple:
                    inforDic['right'] = True

            inforList.append(inforDic)
            number += 1

        return inforList

    def create_context(self):
        numbers_information = AppleGetter.caculator.get_num1_and_num2()
        numbers = numbers_information[0]
        operator = numbers_information[1]
        AppleGetter.cacualated_ans = numbers_information[2]

        ture_color = AppleGetter.appleInitor.get_color()[0]
        show_color = AppleGetter.appleInitor.get_color()[1]

        AppleGetter.needed_apple = random.randint(0, 3)
        AppleGetter.question_type = random.randint(0, 1)

        apple_infor_list = self.build_infor_list(ture_color, show_color)

        print AppleGetter.progress_value, ' == progress_new_value'
        context = {
            'progress_value': AppleGetter.progress_value,
            'question_type': AppleGetter.question_type,
            'need_apple': AppleGetter.needed_apple,
            'apple_number': AppleGetter.appleNum,
            'apple_list': apple_infor_list,
            'num1': numbers[0],
            'num2': numbers[1],
            'num3': numbers[2],
            'num4': numbers[3],
            'opera': operator,
        }
        ans = numbers_information[2]
        print ans

        return context


class FinishHandler(View):
    def get(self, request):

        ip = get_client_ip(request)
        finisher = Finisher(ip=ip, apple_number=globle_apple_number)
        finisher.save()

        max_val = 80
        a = 100*1.0/(max_val**2)
        global globle_apple_number
        # globle_apple_number = 50
        percent = (globle_apple_number**2) * a

        percent = math.sqrt(percent) * 10
        context = {
            'apple_number': globle_apple_number,
            'percent': percent
        }
        return render(request, 'finish.dhtml', context)
