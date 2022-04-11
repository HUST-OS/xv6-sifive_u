// Print Logo
#include "include/types.h"
#include "include/riscv.h"

#if QEMU == SIFIVE_U
void print_logo() {
    printf("  (`-.            (`-.                            .-')       ('-.    _   .-')\n");
    printf(" ( OO ).        _(OO  )_                        .(  OO)    _(  OO)  ( '.( OO )_ \n");
    printf("(_/.  \\_)-. ,--(_/   ,. \\  ,--.                (_)---\\_)  (,------.  ,--.   ,--.) ,--. ,--.  \n");
    printf(" \\  `.'  /  \\   \\   /(__/ /  .'       .-')     '  .-.  '   |  .---'  |   `.'   |  |  | |  |   \n");
    printf("  \\     /\\   \\   \\ /   / .  / -.    _(  OO)   ,|  | |  |   |  |      |         |  |  | | .-')\n");
    printf("   \\   \\ |    \\   '   /, | .-.  '  (,------. (_|  | |  |  (|  '--.   |  |'.'|  |  |  |_|( OO )\n");
    printf("  .'    \\_)    \\     /__)' \\  |  |  '------'   |  | |  |   |  .--'   |  |   |  |  |  | | `-' /\n");
    printf(" /  .'.  \\      \\   /    \\  `'  /              '  '-'  '-. |  `---.  |  |   |  | ('  '-'(_.-'\n");
    printf("'--'   '--'      `-'      `----'                `-----'--' `------'  `--'   `--'   `-----'\n");
}
#else
void print_logo() {
    printf(" (`-')           (`-')                 (`-').->  _                 _           (`-') (`-')  _                    \n");
    printf(" (OO )_.->      _(OO )                 ( OO)_   (_)       <-.     (_)         _(OO ) ( OO).-/              .->   \n");
    printf(" (_| \\_)--.,--.(_/,-.\\  ,--.  (`-')   (_)--\\_)  ,-(`-')(`-')-----.,-(`-'),--.(_/,-.\\(,------.         ,--.(,--.  \n");
    printf(" \\  `.'  / \\   \\ / (_/ /  .'  ( OO).->/    _ /  | ( OO)(OO|(_\\---'| ( OO)\\   \\ / (_/ |  .---'         |  | |(`-')\n");
    printf("  \\    .')  \\   /   / .  / -.(,------.\\_..`--.  |  |  ) / |  '--. |  |  ) \\   /   / (|  '--.    (`-') |  | |(OO )\n");
    printf("  .'    \\  _ \\     /_)'  .-. \\`------'.-._)   \\(|  |_/  \\_)  .--'(|  |_/ _ \\     /_) |  .--' <-.(OO ) |  | | |  \\\n");
    printf(" /  .'.  \\ \\-'\\   /   \\  `-' /        \\       / |  |'->  `|  |_)  |  |'->\\-'\\   /    |  `---.,------.)\\  '-'(_ .'\n");
    printf("`--'   '--'    `-'     `----'          `-----'  `--'      `--'    `--'       `-'     `------'`------'  `-----'   \n");
}
#endif
  

