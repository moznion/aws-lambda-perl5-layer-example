Simple example of aws-lambda-perl5-layer
==

This example provides a simple example of [aws-lambda-perl5-layer](https://github.com/moznion/aws-lambda-perl5-layer) for building and packing a Lambda function.

Precondition
--

- Register a Lambda handler as `handler.handle`

Sequence
--

1. write a function to `handler.pl`
  - this must have `handle` subroutine
2. arrange the dependency
  - please edit `cpanfile`
3. build it
4. upload the built zip archive

How to build
--

```
$ make PERL_VERSION=x.x.x build
```

`x.x.x` is the version of the perl runtime (e.g. `5.28.1`).
You must build it with the same version to the layer's perl version.

Under the hood
--

Following processes are executed on the Docker container (Highly recommend: you should use lambci's Docker container).

1. build the perl runtime with specified version
2. vendor the dependencies by Carton
3. zip components

See: `build.sh`

LICENSE
--

MIT

