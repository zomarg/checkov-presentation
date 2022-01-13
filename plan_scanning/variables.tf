variable "additional_tags" {
  type = map(string)
  default = {
    TEAM = "TESTTEAM"
    BusinessOwner = "GK"
  }
}