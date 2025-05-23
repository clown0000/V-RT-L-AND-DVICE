RUN apt-get update && apt-get install -y \
    wget \
    curl \
    vim \
    xfce4 \
    xfce4-terminal \
    x11vnc \
    xorg \
    google-chrome-stable \
    && apt-get clean

Set up VNC password
RUN echo "your_vnc_password" | x11vnc -storepasswd

Expose VNC port (5900)
EXPOSE 5900

Clone noVNC and start the VNC server with noVNC web client
RUN git clone https://github.com/novnc/noVNC.git /noVNC && \
    cd /noVNC && \
    ./utils/novnc_proxy --vnc localhost:5900 --listen 6080 &

Start the VNC server and Xfce desktop with Google Chrome
CMD ["sh", "-c", "x11vnc -forever -usepw -create & startxfce4 & google-chrome-stable"]
```

