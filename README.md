# MechHead

A photo gallery using data generated from [/r/MechanicalKeyboards](https://www.reddit.com/r/MechanicalKeyboards/). This is an example site showcasing Webpacker (with Vue and ERB integrations) and ActiveStorage.

![MechHead](https://github.com/Illianthe/mechhead/blob/master/public/screenshot.jpg)

## Development

Spin up all Docker containers for development:

```
docker-compose build
docker-compose up
```

Set up databases:
```
docker-compose run --rm web rails db:create
docker-compose run --rm web rails db:schema:load
```

Add test data:

```
docker-compose run --rm web rails reddit:fetch_images
```
