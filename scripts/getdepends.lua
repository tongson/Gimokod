#!/usr/bin/env lua
io.input(arg[1])
pkgbuild=io.read("*all")

function table.contains(table, element)
    for _, value in pairs(table) do
        if value == element then
            return true
        end
    end
    return false
end

depends = string.match(pkgbuild, "depends=%(.-%)")
makedepends = string.match(pkgbuild, "makedepends=%(.-%)")

fulldepends = {}
sub = {}
sub["device-mapper"]      = "lvm2"
sub["gcc-libs"]           = "gcc"
sub["boost-libs"]         = "boost"
sub["libltdl"]            = "libtool"
sub["libjpeg"]            = "libjpeg-turbo"
sub["libgl"]              = "mesa"
sub["libglapi"]           = "mesa"
sub["libegl"]             = "mesa"
sub["ati-dri"]            = "mesa"
sub["intel-dri"]          = "mesa"
sub["nouveau-dri"]        = "mesa"
sub["khrplatform-devel"]  = "mesa"
sub["xorg-server-xvfb"]   = "xorg-server"
sub["xorg-server-common"] = "xorg-server"
sub["xorg-server-devel"]  = "xorg-server"

if string.find(pkgbuild, "depends") then
    for x in string.gmatch(depends, "'([%w%p]+)'" ) do
        if table.contains(fulldepends, x) == false then
            fulldepends[#fulldepends+1] = x
        end
    end
end

if string.find(pkgbuild, "makedepends") then
    for y in string.gmatch(makedepends, "'([%w%p]+)'" ) do
        if table.contains(fulldepends, y) == false then
            fulldepends[#fulldepends+1] = y
        end
    end
end

for i = 1, #fulldepends do
    output = string.gsub(fulldepends[i], "([%w%p]+)", sub)
    io.write(string.format("%s ", output ))
end


