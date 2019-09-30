FROM python:slim-buster
LABEL maintainer Marshall Lai <lai.marshall@gmail.com> 

RUN apt-get update && \
	apt-get -y install curl inotify-tools && \
	rm -rf /var/lib/apt/lists/*  
RUN pip install dns-lexicon

VOLUME ["/letsencrypt"]
RUN mkdir /dns
ADD https://raw.githubusercontent.com/AnalogJ/lexicon/master/examples/dehydrated.default.sh /dns/hook
ADD https://raw.githubusercontent.com/lukas2511/dehydrated/master/dehydrated  ./dehydrated
COPY run.sh config /
RUN chmod +x /dns/hook /run.sh ./dehydrated
ENV EMAIL you@email.com
ENV PROVIDER cloudflare
ENV LEXICON_CLOUDFLARE_USERNAME youcf@email.com
ENV LEXICON_CLOUDFLARE_TOKEN asdasdfasdfasfasfasfasf

ENTRYPOINT ["/bin/bash"]
CMD ["./run.sh"]

