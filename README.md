# monogame_on_ubuntu
script for install/setup [monogame](https://www.monogame.net/) devellop on ubuntu
# script's feature
- install mono
- install dotnet 
- install monogame template
- (optional) install visual studio code + monogame template 
# how use it
```
sudo chmod +x install-monogame.bash
./install-monogame.bash
```
## when it launch
don't be surprise it take some minutes for setting up

# create project
```
dotnet new <TemplateID> -o <ProjectName>
```
TemplateID = name id template<br>
ProjectName = name's directory of game

get list id template
```
dotnet new -l
```

# run project
go in game's dir and tape
```
dotnet run Program.cs
```

