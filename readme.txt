To run the jupyter lab file that trains the transformer with the exact same operating system, python version and required libraries in 'production' please run the jupyter lab through this Dockerfile:

docker run -p 8080:8080 -v "$(pwd)":/app/notebooks my_jupyter_lab_image

