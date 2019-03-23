> log.txt
for f in in/*; do
    echo "$f";
    for i in {1..1000000}; do
        echo "$i";
        # Do not send in non-ASCII characters:
        # http://www.linuxcertif.com/man/1/zzuf/
        zzuf --seed $i --ratio 0.2 --max-crashes 0 \
                --refuse '\x00-\x1f\x7f-\xff' \
        cat "$f" | timeout -k 1 1 ./k &>> log.txt
    done
done
