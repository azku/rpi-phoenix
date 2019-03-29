FROM arm32v7/elixir

LABEL mantainer="Asier Azkuenaga <azku@zebixe.com>"


RUN apt-get update && \
    curl -sL https://deb.nodesource.com/setup_6.x | bash - && \
    apt-get install -y nodejs

RUN mix local.hex --force

RUN mix archive.install hex phx_new 1.4.2 --force

RUN mix local.hex --force && \
    mix local.rebar --force

WORKDIR /opt/app

CMD ["/bin/bash"]