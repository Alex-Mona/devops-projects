#!/bin/bash

scp /home/gitlab-runner/builds/mpKDDz2c/0/students/DO6_CICD.ID_356283/eeveegod_student.21_school.ru/DO6_CICD-0/src/cat/s21_cat eeveegod@10.10.0.2:/usr/local/bin/
scp /home/gitlab-runner/builds/mpKDDz2c/0/students/DO6_CICD.ID_356283/eeveegod_student.21_school.ru/DO6_CICD-0/src/grep/s21_grep eeveegod@10.10.0.2:/usr/local/bin/
ssh eeveegod@10.10.0.2 ls -lah /usr/local/bin