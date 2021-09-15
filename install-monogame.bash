#! /bin/bash
c=2
echo install .net sdk

wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O /tmp/packages-microsoft-prod.deb
sudo dpkg -i /tmp/packages-microsoft-prod.deb
sudo apt update

sudo apt-get install -y apt-transport-https
sudo apt-get install -y dotnet-sdk-5.0

echo install MONO

sudo apt install gnupg ca-certificates
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
echo "deb https://download.mono-project.com/repo/ubuntu stable-focal main" | sudo tee /etc/apt/sources.list.d/mono-official-stable.list
sudo apt update
while [c != 1 ] && [ c != 0 ]; do
	echo install visual studio code 1/yes 0/no
	read c
done
if [ c==1 ];then
	curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > /tmp/packages.microsoft.gpg
	sudo install -o root -g root -m 644 /tmp/packages.microsoft.gpg /etc/apt/trusted.gpg.d/
	sudo sh -c 'echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
	sudo apt update
	sudo apt-get install code

	echo monogame templates

	code --install-extension ms-dotnettools.csharp
fi
echo install MGCB editor

dotnet tool install --global dotnet-mgcb-editor
mgcb-editor --register

echo install wine

sudo apt install wine64 p7zip-full
wget -qO- https://raw.githubusercontent.com/MonoGame/MonoGame/develop/Tools/MonoGame.Effect.Compiler/mgfxc_wine_setup.sh | bash
