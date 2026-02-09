sudo a2enmod rewrite http2 ssl
flutter build web --wasm
# Example command to run the tests this code supports
pytest -v modules/http2

./configure --prefix=/path/to/install \
            --enable-http2 \
            --enable-ssl \
            --enable-mpms-shared=all
make
make install
apxs -c mod_h2test.c
# Ensure your environment points to the newly built httpd
export HTTPD_PATH=/path/to/install/bin/httpd
pytest -v test/modules/http2
# Build the production Flutter web app
flutter build web --release
