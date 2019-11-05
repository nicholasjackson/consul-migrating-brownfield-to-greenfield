kind = "service-splitter"
name = "api"
splits = [
  {
    weight = 100
  },
  {
    weight  = 0
    service = "api-cloud"
  },
]
