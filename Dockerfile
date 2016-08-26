FROM ivotron/pandoc

RUN apt-get -yq update
RUN apt-get -y install \
	inkscape \
	texlive-xetex \
	texlive-lang-german \
	texlive-fonts-extra \
	biber

RUN mkdir /source

WORKDIR /source
ENTRYPOINT make
CMD ["all"]
