import requests
from bs4 import BeautifulSoup
from PIL import Image, ExifTags,ImageFile
import exif
ImageFile.LOAD_TRUNCATED_IMAGES = True

with open("demo.html") as fp:
    soup = BeautifulSoup(fp, 'html.parser')

img_tags = soup.find_all('img')
urls = [img['src'] for img in img_tags]
print("Here are the images on your page: " +str(urls))

#######

for i in urls:
    #img = Image.open(i)
    with open(i, 'rb') as image_file:
        img = exif.Image(image_file)
        if img.get('model') is None:
            print("Image " + str(i) + " does not have a tag and cannot be verified")
        else:
            print("Image " + str(i) + " has a tag " + str(img.get('model')) + " and is verified")
    # <class 'PIL.Image.Exif'>
    # def get_field (exif,field) :
    #   for (k,v) in exif.items():
    #      print(k)
    #      if TAGS.get(k) == field:
    #         return v
    #
    # # exif = img.getexif()
    # print("Tag: " + str(get_field(exif,'IDtag')))
