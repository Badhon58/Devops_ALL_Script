## Environment Variables

- For a Single ENV like x=2 the docker command is

```
$ docker run --rm -it -e APP=test NAME=BADHON ubuntu:latest printenv
```

- For a File of ENV

  ```bash
  vim allenv
      APP=TEST
      NAME=Badhon

   docker run --rm -it --env-file allenv ubuntu:latest printenv
  ```

### Environment Variables

--env / -e / --env-file

```bash
docker run --env VARIABLE1=foobar ubuntu:latest printenv

echo VARIABLE1=foobar1 >> my-env.txt
echo VARIABLE2=foobar2 >> my-env.txt
echo VARIABLE#=foobar2 >> my-env.txt

```

Now, let's inject this file into our Docker container:

```bash

docker run --env-file my-env.txt ubuntu:latest printenv

```
