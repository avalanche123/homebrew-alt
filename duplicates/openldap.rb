require 'formula'

class Openldap < Formula
  url 'ftp://ftp.openldap.org/pub/OpenLDAP/openldap-release/openldap-2.4.24.tgz'
  homepage 'http://www.openldap.org/software/'
  md5 '116fe1e23a7b67686d5e62274367e6c0'

  depends_on 'berkeley-db' if ARGV.include? "--with-berkley-db"

  def install
    args = ["--disable-debug", "--disable-dependency-tracking", "--prefix=#{prefix}"]

    args.push "--enable-bdb" if ARGV.include? "--with-berkley-db"

    system "./configure", *args
    system "make install"
    system "mkdir", '-p', var+"run"
  end

  def options
    [
      ["--with-berkley-db", "compile openldap with berkley-db support"],
    ]
  end
end