Name:       harbour-pitot

Summary:    Pitot
Version:    1.0.5
Release:    1
Group:      Qt/Qt Mobility
License:    MIT
URL:        https://github.com/sharks-dev/harbour-pitot
Source0:    %{name}-%{version}.tar.bz2
Requires:   sailfishsilica-qt5 >= 0.10.9
BuildRequires:  pkgconfig(sailfishapp) >= 1.0.2
BuildRequires:  pkgconfig(Qt5Core)
BuildRequires:  pkgconfig(Qt5Qml)
BuildRequires:  pkgconfig(Qt5Quick)
BuildRequires:  desktop-file-utils
BuildRequires:  qt5-qttools-linguist

%description
Pitot is a simple GPS/GLONASS speedometer for your SailfishOS device. It shows your current speed in big, friendly letters and can convert to multiple different speed units. This application was originally developed by Mikko Ahlroth (Nicd).

# This description section includes metadata for SailfishOS:Chum, see
# https://github.com/sailfishos-chum/main/blob/main/Metadata.md
%if 0%{?_chum}
Title: Pitot
Type: desktop-application
DeveloperName: Sharks
PackagedBy: Sharks
Categories:
 - Utility
Custom:
  Repo: https://github.com/sharks-dev/harbour-pitot
PackageIcon: https://github.com/sharks-dev/harbour-pitot/raw/master/icons/172x172/harbour-pitot.png
Screenshots:
 - https://github.com/sharks-dev/harbour-pitot/raw/master/screenshots/portrait.png
 - https://github.com/sharks-dev/harbour-pitot/raw/master/screenshots/units.png
 - https://github.com/sharks-dev/harbour-pitot/raw/master/screenshots/about.png
 - https://github.com/sharks-dev/harbour-pitot/raw/master/screenshots/cover.png
 - https://github.com/sharks-dev/harbour-pitot/raw/master/screenshots/getting_location.png
 - https://github.com/sharks-dev/harbour-pitot/raw/mmaster/screenshots/landscape.png
Links:
  Homepage: https://github.com/sharks-dev/harbour-pitot
  Bugtracker: https://github.com/sharks-dev/harbour-pitot/issues
%endif

%prep
%setup -q -n %{name}-%{version}

%build

%qmake5 

%make_build


%install
%qmake5_install


desktop-file-install --delete-original         --dir %{buildroot}%{_datadir}/applications                %{buildroot}%{_datadir}/applications/*.desktop

%files
%defattr(-,root,root,-)
%{_bindir}/%{name}
%{_datadir}/%{name}
%{_datadir}/applications/%{name}.desktop
%{_datadir}/icons/hicolor/*/apps/%{name}.png
