# ------------------------------
# PIPEWIRE AND EASYEFFECTS SETUP
# ------------------------------

# Install pipewire from repository
add-apt-repository ppa:pipewire-debian/pipewire-upstream -y
add-apt-repository ppa:pipewire-debian/wireplumber-upstream -y
apt update
apt install pipewire -y
apt upgrade -y

# Install wireplumber
apt purge pipewire-media-session -y
apt install wireplumber -y
apt install pipewire-pulse -y
apt purge pulseaudio -y
apt autoremove -y

# Mask pulseaudio
systemctl --user --now disable pulseaudio.service pulseaudio.socket
systemctl --user mask pulseaudio
systemctl --user --now enable pipewire pipewire-pulse wireplumber

# Additional packages
apt install libldacbt-abr2 libldacbt-enc2 libspa-0.2-bluetooth pipewire-audio-client-libraries libspa-0.2-jack -y

# ----------- YOU CAN REMOVE THIS PART IF YOU DON'T WANT EASYEFFECTS ----------

apt install --no-install-recommends xdg-desktop-portal-gnome -y
flatpak install app/com.github.wwmm.easyeffects/x86_64/stable -y
flatpak permission-reset com.github.wwmm.easyeffects

# -----------------------------------------------------------------------------

echo "Installation finished. Please restart your computer."
