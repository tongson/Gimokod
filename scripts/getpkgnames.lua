#!/usr/bin/env lua
io.input(arg[1])
pkgbuild=io.read("*all")

if string.find(pkgbuild, "pkgbase") then
    pkgnames = string.match(pkgbuild, "pkgname=%(.-%)")
    pkgname = {}
    for w in string.gmatch(pkgnames, "'([%a-_]+)'" ) do
        pkgname[#pkgname+1] = w
    end
    for i = 1, #pkgname do
        io.write(string.format("%s ", pkgname[i] ))
    end
else
    pkgname = string.match(pkgbuild, "pkgname=([%a-_]+)")
    io.write(string.format("%s", pkgname ))
end

