service {
  name = "web"
  id   = "web-v1"
  port = 9090

  connect {
    sidecar_service {

      proxy {
        upstreams {
          destination_name = "api"
          local_bind_port  = 9091
        }
      }
    }
  }
}
