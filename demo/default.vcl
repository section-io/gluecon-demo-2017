vcl 4.0;

backend default {
    .host = "varnish-upstream";
    .port = "80";
}