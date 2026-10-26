# Network Troubleshooting Playbook

## Step 1 — Is it one computer or everyone?
- Ask: is anyone else affected? If everyone is affected, check the router/switch and the internet link first, not one PC.
- If only one computer is affected, stay on that computer.

## Step 2 — Check the cable / Wi-Fi
- Cable: is it firmly plugged in at both ends? Is the link light on?
- Wi-Fi: is the computer connected to the correct network name? Is Wi-Fi turned on?
- Try a different cable or a different network port if one is available.

## Step 3 — Check the address (IP)
- Windows: run `ipconfig` — look for an IPv4 address. An address starting with 169.254 usually means no DHCP address was received.
- Linux/macOS: run `ip addr` or `ifconfig`.
- If there is no valid address, restart the network adapter, then check the DHCP server / router.

## Step 4 — Check the gateway and DNS
- Ping the gateway (router). If it fails, the problem is local (cable, switch, adapter).
- Ping a public address by number (e.g. 8.8.8.8). If the number works but a name fails, the problem is DNS.
- If DNS fails, check the DNS server setting, then try a known public DNS server only if your workplace policy allows it.

## Step 5 — Check the application and the port
- Is the problem one website/app, or everything? One app = check that app, its login, and its port.
- Use the check script to test whether a port is open on a host you manage.

## Step 6 — Write it down and escalate cleanly
- Record: what the user reported, what you checked, what the result was, and what you changed.
- If you escalate, send that record with the ticket — do not send only "network not working".
