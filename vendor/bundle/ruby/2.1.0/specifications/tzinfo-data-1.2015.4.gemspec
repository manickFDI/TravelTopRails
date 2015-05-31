# -*- encoding: utf-8 -*-
# stub: tzinfo-data 1.2015.4 ruby lib

Gem::Specification.new do |s|
  s.name = "tzinfo-data"
  s.version = "1.2015.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Philip Ross"]
  s.cert_chain = ["-----BEGIN CERTIFICATE-----\nMIIDdDCCAlygAwIBAgIBATANBgkqhkiG9w0BAQUFADBAMRIwEAYDVQQDDAlwaGls\nLnJvc3MxFTATBgoJkiaJk/IsZAEZFgVnbWFpbDETMBEGCgmSJomT8ixkARkWA2Nv\nbTAeFw0xNDA5MjgxOTA4MDdaFw0xNTA5MjgxOTA4MDdaMEAxEjAQBgNVBAMMCXBo\naWwucm9zczEVMBMGCgmSJomT8ixkARkWBWdtYWlsMRMwEQYKCZImiZPyLGQBGRYD\nY29tMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAkZzB+qfhmyY+XRvU\nu310LMTGsTkR4/8JFCMF0YeQX6ZKmLr1fKzF3At1+DlI+v0t/G2FS6Dic0V3l8MK\nJczyFh72NANOaQhAo0GHh8WkaeCf2DLL5K6YJeLpvkvp39oxzn00A4zosnzxM50f\nXrjx2HmurcJQurzafeCDj67QccaNE+5H+mcIVAJlsA1h1f5QFZ3SqQ4mf8St40pE\n6YR4ev/Eq6Hb8aUoUq30otxbeHAEHh8cdVhTNFq7sPWb0psQRF2D/+o0MLgHt8PY\nEUm49szlLsnjVXAMCHU7wH9CmDR/5Lzcrgqh3DgyI8ay6DnlSQ213eYZH/Nkn1Yz\nTcNLCQIDAQABo3kwdzAJBgNVHRMEAjAAMAsGA1UdDwQEAwIEsDAdBgNVHQ4EFgQU\nD5nzO9/MG4B6ygch/Pv6PF9Q5x8wHgYDVR0RBBcwFYETcGhpbC5yb3NzQGdtYWls\nLmNvbTAeBgNVHRIEFzAVgRNwaGlsLnJvc3NAZ21haWwuY29tMA0GCSqGSIb3DQEB\nBQUAA4IBAQCI4Ucln0W425HOc2mIaXkAiHWNs1Fv/rCPrBIwBYhjStVYUEPCIhEf\nMRCqpeOog3+b31SMIqqHQcNnjY9/YHeJCQ5vsRyN/A7+nafQ+PjI+E5HIl5Bd8Hk\nnbizkcvM/qE8w2IWuadTRzGzeBolzVp4gl/GLP9wT1H+cTjC7zCjgbxnwM7zLnxA\nF4XcKGArAMYd8GgHUTVwMsYP4XkM3CGWtuk8pmgCo2CKZA4PDrWYiuo+vtwFsgYJ\nhKe67BDNyG4DxJTu6tP979ZXanCYEDWmxJMSm4Ih9tObHryZc6xp1SsM4jPR6Mbt\nOWpW9iGQHkfCktjw+bYdDKVK8c0WU5PN\n-----END CERTIFICATE-----\n"]
  s.date = "2015-04-24"
  s.description = "TZInfo::Data contains data from the IANA Time Zone database packaged as Ruby modules for use with TZInfo."
  s.email = "phil.ross@gmail.com"
  s.extra_rdoc_files = ["README.md", "LICENSE"]
  s.files = ["LICENSE", "README.md"]
  s.homepage = "http://tzinfo.github.io"
  s.licenses = ["MIT"]
  s.rdoc_options = ["--title", "TZInfo::Data", "--main", "README.md", "--exclude", "definitions", "--exclude", "indexes"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.8.7")
  s.rubygems_version = "2.2.2"
  s.summary = "Timezone Data for TZInfo"

  s.installed_by_version = "2.2.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<tzinfo>, [">= 1.0.0"])
    else
      s.add_dependency(%q<tzinfo>, [">= 1.0.0"])
    end
  else
    s.add_dependency(%q<tzinfo>, [">= 1.0.0"])
  end
end
