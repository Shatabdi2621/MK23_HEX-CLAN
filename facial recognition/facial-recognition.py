import os
import os.path
import face_recognition
import mechanize
import wget 
import mysql.connector

mydb = mysql.connector.connect(
 host="", #localhost ip or any cloud server endpoint
 user="", #specified while registering
 password="", #password of database
 database="photos") #name of the schema
browser = mechanize.Browser()
browser.set_handle_robots(False)
while(True):
    try:
      response = browser.open('enter the location of uploaded image') 
      t=response.code
      if t == 200:
        url = "enter the location of uploaded image"
        wget.download(url, 'database location to save file')
        break
    except:
    	print('fetching....')
    	continue
images = os.listdir('directory to datasets')

image_to_be_matched = face_recognition.load_image_file('image file')


image_to_be_matched_encoded = face_recognition.face_encodings(
                              image_to_be_matched)[0]
for image in images:
           current_image = face_recognition.load_image_file("file"+ image)
           current_image_encoded = face_recognition.face_encodings(current_image)[0]
           result = face_recognition.compare_faces(
                    [image_to_be_matched_encoded], current_image_encoded)
           if result[0]==True:
           	flag = 1
           else:
           	flag = 0
if flag == 1:
           	mySql_insert_query = """INSERT INTO status_verify (status) VALUES ('verified') """
           	cursor = mydb.cursor()
           	cursor.execute(mySql_insert_query)
           	mydb.commit()
           	print(cursor.rowcount, "Record inserted successfully into status_verify table")
           	cursor.close()
else:
           	mySql_insert_query = """INSERT INTO status_verify (status) VALUES ('not verified') """
           	cursor = mydb.cursor()
           	cursor.execute(mySql_insert_query)
           	mydb.commit()
           	print(cursor.rowcount, "Record inserted successfully into status_verify table")
           	cursor.close()           
os.remove('location of the donloaded image') #while working on local host to prevent collect images of the user 