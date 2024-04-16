from PIL import Image, ImageFile

def combine_images(columns, space, images):
    rows = len(images)//columns
    if len(images)%columns:
        rows+=1
    width_max = max([Image.open(image).width for image in images])
    height_max = max([Image.open(image).height for image in images])
    background_width = width_max*columns + (space*columns) - space
    background_height = height_max*rows + (space*rows) - space
    background = Image.new('RGB', (background_width, background_height), (255, 255, 255, 255))
    x = 0
    y = 0
    for i, image in enumerate(images):
        img = Image.open(image)
        x_offset = int((width_max - img.width)/2)
        y_offset = int((height_max - img.height)/2)
        background.paste(img, (x+x_offset, y+y_offset))
        x += width_max + space
        if (i+1) % columns == 0:
            y += height_max + space
            x = 0
    background.save('image.png')

combine_images(columns=48, space=10, images=['22mar.png', 
                                             '22mar2.png', 
                                             '22apr.png',
                                             '22apr1.png',
                                             '22apr2.png',
                                             '22apr3.png',
                                             '22apr4.png',
                                             '22apr5.png',
                                             '22apr6.png',
                                             '22apr7.png',
                                             '22apr8.png',
                                             '22apr9.png',
                                             '22apr10.png',
                                             '22apr11.png',
                                             '22apr12.png',
                                             '22apr13.png',])
