include .env

checkImagick:
	docker exec -i $(APP_NAME)-php-$(PHP_VER_FPM) php -r 'echo "imagick is ".(extension_loaded("imagick")?"":"not ")."installed\n";'

checkSwoole:
	docker exec -i $(APP_NAME)-php-$(PHP_VER_FPM) php --ri swoole | grep Version

installLaravel:
	#docker exec -it $(APP_NAME)-php-$(PHP_VER_FPM) composer create-project laravel/laravel ~/Projects/marketplace/app-marketplace
	docker run --rm -v ~/Projects/marketplace/app-marketplace/:/app composer create-project laravel/laravel /app \
	&& sudo chown -R $(USER):$(USER) ~/Projects/marketplace/app-marketplace

setSymlinkToApp:
	cd $(PWD)/$(APP_PATH) && ln -snf ~/Projects/marketplace/app-marketplace project \
	&& docker restart $(APP_NAME)-php-$(PHP_VER_FPM) $(APP_NAME)-nginx
