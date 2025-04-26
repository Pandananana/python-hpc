import numpy as np
from PIL import Image
import sys
import os

def huehist(image):
    bins = np.linspace(0, 255, 64 + 1)
    hsv_image = np.asarray(Image.fromarray(image).convert('HSV'))
    hue_values = hsv_image[:, :, 0].reshape(-1)
    hue_hist = np.histogram(hue_values, bins)[0]
    return hue_hist

index = int(sys.argv[1])
BASE_URL = "/dtu/projects/02613_2024/data/celeba/images"
base_folders = os.listdir(BASE_URL)

FOLDER_URL = f"{BASE_URL}/{base_folders[index]}"
pictures = os.listdir(FOLDER_URL)

combined_hist = []

for picture in pictures:
    URL = f"{FOLDER_URL}/{picture}"
    img = np.array(Image.open(URL))
    combined_hist.append(huehist(img))

combined_hist = np.array(combined_hist)
print("Shape: ", combined_hist.shape)

summed_hist = np.sum(combined_hist, axis=0)
np.save(f"subhists/subhist_{index}", summed_hist)
print(f"Saved histogram to subhists/subhist_{index}")


