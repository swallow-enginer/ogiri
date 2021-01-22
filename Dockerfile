#Rubyのイメージを元にコンテナを作成
FROM ruby:2.6.5

#railsに必要なnodejsとpostgresをインストール
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

#yarnパッケージ管理ツールをインストール
RUN apt-get update && apt-get install -y curl apt-transport-https wget && \
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
apt-get update && apt-get install -y yarn

# Node.jsをインストール
RUN curl -sL https://deb.nodesource.com/setup_7.x | bash - && \
apt-get install nodejs

#ディレクトリの構築
#作業ディレクトリの作成
RUN mkdir /myapp
#作業ディレクトリの設定
WORKDIR /myapp
#Gemfileをコンテナにコピー
COPY Gemfile /myapp/Gemfile
#Gemfile.lockをコンテナにコピー
COPY Gemfile.lock /myapp/Gemfile.lock
#Gemfileで管理されているライブラリーをインストール
RUN bundle install
#コンテナにローカルのファイルをコピー
COPY . /myapp

# コンテナがスタートする度に実行される
#binにentrypoint.shをコピー
COPY entrypoint.sh /usr/bin/
#entrypoint.shを実行
RUN chmod +x /usr/bin/entrypoint.sh
#docker run時に実行
ENTRYPOINT ["entrypoint.sh"]
#コンテナのポート番号
EXPOSE 3000

# railsの立ち上げコマンド
CMD ["rails", "server", "-b", "0.0.0.0"]