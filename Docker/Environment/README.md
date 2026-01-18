## Docker Environment Variables
docker run --env VARIABLE1=football alpine:3 env

echo VARIABLE1=football1 > my-env.txt
echo VARIABLE2=football2 >> my-env.txt
echo VARIABLE3=football3 >> my-env.txt

Now lets inject this file into our docker container:
docker run --rm -it --env-file my-env.txt alpine:3 env
