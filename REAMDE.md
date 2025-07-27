# SKIDLAB :: Vault33 Tactical Toolkit

**Repo Type:** Field-Ready Payload & Utility Scripts  
**Terminal Node:** HYPR-LITE  
**Vault Registration:** V33-HYPR

---

##  Lore
> Recovered from the pre-war ruins of a Vault-Tec sanctioned Sony VAIO facility, the HYPR-LITE terminal was repurposed by Vault33 operatives to serve as a mobile, self-sufficient adversarial emulator and payload delivery system. 
>
> SKIDLAB is the kit drop. The toolbox. The vault’s unsanctioned response to sanitized cyber hygiene. When digital chaos needs to be weaponized in a training environment, SKIDLAB delivers.

---

##  Contents

This repository includes:

- `pull.sh` – Simple script to download remote files
- `grabkit.sh` – Git repo clone or updater for field tools
- `getkits.sh` – Menu-driven installer for preset payloads
- `/payloads/` – Realistic demo payloads and training stagers
- `/demos/` – Terminal walkthroughs and emulation flows

---

##  Quickstart

###  Download via Terminal
```bash
curl -O https://skidlab.heavyhacks.com/tools/pull.sh
```

###  Clone Entire Toolkit
```bash
git clone https://github.com/ATHL337/skidlab.git ~/HYPR/SkidLab
```

---

##  Suggested HYPR Folder Structure
```
~/HYPR/
├── Payloads/
├── SkidLab/         ← git repo lives here
├── Tools/
├── ISO-Drops/
├── USB-Staging/
```

---

##  Usage
- Drop this repo into any compatible terminal node (Raspberry Pi, field laptop, clean VM)
- Run `getkits.sh` to choose curated payload drops
- Use `pull.sh` or `grabkit.sh` for custom kits
- Demo or teach threat emulation concepts safely

---

##  Credits & Contact
Built by Vault33 operator @ATHL337  
Terminal: [HYPR-LITE::VAIO-Class::Terminal]  
Live tools: https://skidlab.heavyhacks.com
