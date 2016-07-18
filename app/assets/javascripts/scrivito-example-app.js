var ScrivitoExampleApp = function () {

  function initBackgroundImages(content) {
    $(content).find("[data-background-image-url]").each(function() {
      var url = $(this).data("backgroundImageUrl");
      $(this).css({
        background: "url(" + url + ")",
        backgroundSize: "cover"
      });
    });
  }

  function initEkkoLightBox(content) {
    $(content).delegate('*[data-toggle="lightbox"]', 'click', function(event) {
      event.preventDefault();
      $(this).ekkoLightbox();
    });
  }

  function initGoogleMaps(content) {
    $(content).find(".scrivito-map").each(function() {
      var selector = "#" + this.id;
      var map_div = $(this);
      var address = map_div.data("address");
      var height = map_div.data("height");
      var type = map_div.data("type");
      map_div.css("height", height);
      map_div.css("width", "100%");
      GMaps.geocode({
        address: address,
        callback: function(results, status) {
          var lat = 40.748866;
          var lng = -73.988366;
          var viewport = null;
          if (status == "OK") {
            var latlng = results[0].geometry.location;
            lat = latlng.lat();
            lng = latlng.lng();
            viewport = results[0].geometry.viewport;
          }
          if (type == "api") {
            var map = new GMaps({
              el: selector,
              scrollwheel: false,
              lat: lat,
              lng: lng
            });

            if (viewport != null) {
              map.fitBounds(viewport);
            }

            map.addMarker({
              lat: lat,
              lng: lng,
              title: address,
              infoWindow: {
                content: address,
              },
            });
          } else { // type == "static"
            var width = map_div.width();
            var height = map_div.height();
            var scale = 1;
            if (width > 640) {
              width = Math.floor(width / 2);
              height = Math.floor(height / 2);
              scale = 2;
            }
            url = GMaps.staticMapURL({
              size: [width, height],
              scale: scale,
              lat: lat,
              lng: lng,
              markers: [
                {
                  lat: lat,
                  lng: lng,
                  title: address,
                  infoWindow: {
                    content: address,
                  }
                }
              ]
            });
            map_div.html($('<img/>').attr('src', url));
          }
        }
      });
    });
  }

  function addGoogleMapsOnContent() {
    scrivito.on("content", function(content) {
      initGoogleMaps(content);
    });
  }

  function addEkkoLightBoxOnContent() {
    scrivito.on("content", function(content) {
      initEkkoLightBox(content);
    });
  }

  function addBackgroundImagesOnContent() {
    scrivito.on("content", function(content) {
      initBackgroundImages(content);
    });
  }

  return {
    init: function() {
      if (scrivito.in_editable_view()) {
        addBackgroundImagesOnContent();
        addGoogleMapsOnContent();
        addEkkoLightBoxOnContent();
      } else {
        initGoogleMaps(document);
        initEkkoLightBox(document);
        initBackgroundImages(document);
      }
    }
  };

}();

jQuery(document).ready(function() {
  ScrivitoExampleApp.init();
});
