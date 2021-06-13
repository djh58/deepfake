import exif


#this is stand-in for a hashcode. Exchange for hashcode later.
imID = 'IDtag'

#Open image file
with open('whitehouse.jpeg', 'rb') as image_file:
    my_image = exif.Image(image_file)

#Set 'model' tag as = image ID
my_image.set('model',imID);

#Save modified image
with open('whitehouse_tagged.jpg', 'wb') as new_image_file:
     new_image_file.write(my_image.get_file())
