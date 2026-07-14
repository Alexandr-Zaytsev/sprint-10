#!/bin/bash


mkdir -p task task/dir1 task/dir2 task/dir3/dir4

# создаём каталог task с вложенными директориями
# task
#   dir1
#   dir2
#   dir3
#       dir4

cd task
# изменяем текущую директорию на task

touch dir2/empty
# создаём пустой файл task/dir2/empty

touch dir2/hello.sh 
cat > dir2/hello.sh << 'EOF'
#!/bin/bash
echo "$1, привет!"
EOF

# создаём файл task/dir2/hello.sh с таким содержанием:
# #!/bin/bash
# echo "$1, привет!"

chmod 764 dir2/hello.sh
# устанавливаем для task/dir2/hello.sh права rwxrw-r--

ls dir2 | sort > dir2/list.txt
# сохраняем список файлов task/dir2 в task/dir2/list.txt

cp -r dir2/. dir3/dir4
# копируем содержимое каталога task/dir2 в каталог task/dir3/dir4

find . -name "*.txt" >> dir1/summary.txt
# записываем в task/dir1/summary.txt список файлов с расширением *.txt
# находящихся в task, включая поддиректории

cat dir2/list.txt >> dir1/summary.txt
# дописываем в task/dir1/summary.txt содержимое task/dir2/list.txt

export NAME="Всем студентам"
# определяем переменную окружения NAME со значением "Всем студентам"

dir2/hello.sh "$NAME" >> dir1/summary.txt
# запускаем task/dir2/hello.sh с переменной окружения NAME в качестве аргумента
# вывод скрипта должен дописаться в файл task/dir1/summary.txt

mv dir1/summary.txt "Практическое задание"
# перемещаем с переименованием task/dir1/summary.txt в task/Практическое задание

cat "Практическое задание"
# выводим на консоль содержимое файла task/Практическое задание

grep "dir" "Практическое задание" | sort
# ищем в файле "Практическое задание" строки, которые содержат слово "dir"
# и затем отсортировываем их

cd ..
# меняем текущую директорию на родительскую для task

rm -rf task
# удаляем директорию task со всем содержимым
