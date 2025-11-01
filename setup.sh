# อัพเดตระบบ
sudo apt update -y

# โหลด git
sudo apt install -y git

# ติดตั้ง Python3 และ pip
sudo apt install -y python3 python3-pip

# โหลด docker
sudo apt install -y ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
  https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

# ตั้งค่าให้ Docker เริ่มทำงานอัตโนมัติ
sudo systemctl enable docker

# รัน docker
sudo systemctl start docker

# เพิ่ม access ให้ user
sudo usermod -aG docker $USER

# โหลดสิทธิ์ใหม่ทันทีโดยไม่ต้องออกจากระบบ
newgrp docker

# โคลน project
git clone https://github.com/your-project

# cd เข้าโปรเจค
cd your-project

# compose โปรเจคขึ้นมา
docker compose up -d --build
