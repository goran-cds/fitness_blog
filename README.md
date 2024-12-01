# FitnessBlog

To start your Phoenix server:

- Run `mix setup` to install and setup dependencies
- Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Convert all Docx to MD (with pandoc)

Convert to MD

```
for file in *.docx; do pandoc -s "$file" -t markdown -o "${file%.docx}.md"; done
```

Remove images & meta
for file in _.md; do sed -i '' '/^|._|$/d' "$file"; done
for file in _.md; do sed -i '' '/^+._+$/d' "$file"; done

## Learn more

- PGVECTOR ON FLY https://github.com/toranb/fly-pgvector

## User & pass

- email: admin@prismanet.nl
- pass: admin1234

## Hetzner demo machine

Demo machine credentials

- IP: 195.201.142.152
- user: root
- pass: HNUR315YDUdRr8nALqxQjRwkhsEdLi8s

Initial setup

- [Install postgres & pgvector](https://medium.com/@lostargon/how-to-set-up-pg-vector-on-ubuntu-or-debian-b92964bfb253)
- [Install Elixir & BEAM](https://elixir-lang.org/install.html#gnulinux)
- [Install & Configure NGINX reverse proxy](https://www.digitalocean.com/community/tutorials/how-to-configure-nginx-as-a-reverse-proxy-on-ubuntu-22-04)
- [Configure NGINX to work with Liveview](https://elixirforum.com/t/deploying-phoenix-with-nginx/41039/4)
- Generate SSH KEY and add it into your github
  ```
  ssh-keygen -t ed25519 -C "paul.sabou@gmail.com"
  ```
