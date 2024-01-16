
# Unix utils 

1.Determine the pathname of the working directory. What is the root directory? What pathname did you get (relative or absolute)?


To determine the working directory run the following command:

```sh
    pwd

# output: /home/nordwest
```


What is the root directory?

The root directory, represented by "/" is the starting point for the entire system.

```sh
    cd / && pwd

# output: /
```

What pathname did you get (relative or absolute)?

The provided path by pwd commands is an absolute paths as it start with "/".

---

2.Create two subdirectories in the initial directory. View the contents of the working directory. View the contents of the parent directory without going into it.

```sh
    cd ~ && mkdir subdir1 subdir2 && ls
# output: subdir1  subdir2
```

List the content of the parent dir without going into it

```sh
    ls ..

# output: nordwest
```

---

3.Go to the system directory. View its contents. View the contents of the starting directory. Return to home directory

```sh
    cd / && ls

# output: Docker  bin  boot  dev  etc  home  init  lib  lib32  lib64  libx32  lost+found  media  mnt  opt  proc  root  run  sbin  snap  srv  sys  tmp  usr  var
```

View the contents of the starting directory

```sh 
    ls ~ && cd ~

# output: subdir1  subdir2
```

---

4.Delete previously created subdirectories

```sh
    cd ~ && rm -rf subdir1 subdir2 && ls

# output: (empty dir)
```

---

5.Get information on the ls and cd commands using the man utility. 

```sh
    man ls 
```

**cd** command is a built-in shell command, so it doesn't have its own separate executable like many other commands. But we can use the help command:

```sh
    help cd 
```
---
6.Get information on the ls and cd commands using the man utility. 

```sh
    whatis ls
```

Not available for the **cd** command. 

```sh
    apropos ls | grep 'list directory'
```
Not available for the **cd** command. 

---

7.Same with info command 

```sh
    info ls
```

Not available for the **cd** command. 

---

8.Create the following subdirectory structure in your home directory   

```sh 
   cd ~ && mkdir -p tudos/ tudos/1 tudos/1/2 tudos/1/3 tudos/4

# output:

    # tree tudos/

    #     tudos/
    #     ├── 1
    #     │   ├── 2
    #     │   └── 3
    #     └── 4
```

---

9.Print the first and last 13 lines of /etc/group


```sh
    sudo head -n 13 /etc/group

# output:

    # root:x:0:
    # daemon:x:1:
    # bin:x:2:
    # sys:x:3:
    # adm:x:4:syslog,nordwest
    # tty:x:5:
    # disk:x:6:
    # lp:x:7:
    # mail:x:8:
    # news:x:9:
    # uucp:x:10:
    # man:x:12:
    # proxy:x:13:
```

```sh
    sudo head -n 13 /etc/group

# output:

    # input:x:107:
    # sgx:x:108:
    # kvm:x:109:
    # render:x:110:
    # syslog:x:111:
    # uuidd:x:112:
    # tcpdump:x:113:
    # _ssh:x:114:
    # admin:x:115:
    # netdev:x:116:nordwest
    # nordwest:x:1000:
    # mysql:x:117:
    # docker:x:1001:nordwest
```