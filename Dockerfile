FROM ivotron/pandoc

RUN apt-get -yq update
RUN apt-get -y install \
	inkscape \
	texlive-xetex \
	texlive-lang-german \
	biber

RUN mkdir /source

WORKDIR /source
ENTRYPOINT make
CMD ["all"]
