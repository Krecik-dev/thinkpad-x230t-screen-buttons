#! /usr/bin/bash

if [ $XDG_SESSION_TYPE == wayland ]
    then
        screen_info=`kscreen-doctor -o`
        rotation=${screen_info#*Rotation}
        stan=${rotation:8:1}
        input=none
        if [ $@ ]
            then
                input=$@
        fi

        if [ $stan == 1 ]
            then          # Normal
                if [ $input == rot ]
                    then
                        `kscreen-doctor output.LVDS-1.rotation.left`
                elif [ $input == inv ]
                    then
                        `kscreen-doctor output.LVDS-1.rotation.inverted`
                fi
        elif [ $stan == 2 ]
            then          # Left
                if [ $input == rot ]
                    then
                        `kscreen-doctor output.LVDS-1.rotation.none`
                elif [ $input == inv ]
                    then
                        `kscreen-doctor output.LVDS-1.rotation.right`
                fi

        elif [ $stan == 8 ]
            then
                         # Right
                if [ $input == rot ]
                    then
                        `kscreen-doctor output.LVDS-1.rotation.inverted`
                elif [ $input == inv ]
                    then
                        `kscreen-doctor output.LVDS-1.rotation.left`
                fi
        elif [ $stan == 4 ]
            then
                         # Invert
                if [ $input == rot ]
                    then
                        `kscreen-doctor output.LVDS-1.rotation.right`
                elif [ $input == inv ]
                    then
                        `kscreen-doctor output.LVDS-1.rotation.none`
                fi
        fi
elif [ $XDG_SESSION_TYPE == waylander ]
    then
        stan=`xrandr --query --verbose | grep "LVDS-1" | cut -d ' ' -f 6`
        input=none
        echo $stan
        if [ $@ ]
            then
                input=$@
        fi
        if [ $stan == normal ]
            then          # Normal
                if [ $input == rot ]
                    then
                        `kscreen-doctor output.LVDS-1.rotation.left`
                elif [ $input == inv ]
                    then
                        `kscreen-doctor output.LVDS-1.rotation.inverted`
                fi
        elif [ $stan == left ]
            then          # Left
                if [ $input == rot ]
                    then
                        `kscreen-doctor output.LVDS-1.rotation.none`
                elif [ $input == inv ]
                    then
                        `kscreen-doctor output.LVDS-1.rotation.right`
                fi

        elif [ $stan == right ]
            then
                         # Right
                if [ $input == rot ]
                    then
                        `kscreen-doctor output.LVDS-1.rotation.inverted`
                elif [ $input == inv ]
                    then
                        `kscreen-doctor output.LVDS-1.rotation.left`
                fi
        elif [ $stan == inverted ]
            then
                         # Invert
                if [ $input == rot ]
                    then
                        `kscreen-doctor output.LVDS-1.rotation.right`
                elif [ $input == inv ]
                    then
                        `kscreen-doctor output.LVDS-1.rotation.none`
                fi
        fi
fi
