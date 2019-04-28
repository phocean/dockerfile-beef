# What is it?

This Dockerfile allows to build a Docker image for the BeEF framework for XSS browser exploitation (http://beefproject.com/).

It is based on the phocean/msf image, which means it also contains an up-to-date Metasploit framework for the integration in BeEF.

# Build

Make sure to edit the `config.yaml` file for your settings.

In particular, you should change the default username and password (`beef:Pass123`).

Then, build the image:

```
$ docker build -t phocean/beef .
```

# Run

You can run it that way:

```
$ docker run --rm -it --net=host -v $HOME/.msf4:/root/.msf4:Z -v /tmp/msf:/tmp/data:Z --name=beef phocean/beef"
```

Mounting the volumes is optional but will ease the integration with the embedded Metasploit framework.

**Warning:**

> Using --net=host may cause a security risk if the container gets compromised, because the intruder would have access to any host service listening on the loopback interface.
> So, do not use it in production and without knowing th risk.
> A safer option is to map only the ports you need, e.g. with "-p 3000:3000" instead.
