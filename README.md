 *author:Sukuna*
 
 # xv6-sifive_u

   xv6移植到qemu的sifive_u上

 ## 使用方法

   ```
   git clone https://github.com/HUST-OS/xv6-sifive_u.git
   cd xv6-sifive_u
   ```

   然后您可以在qemu上进行运行:

   ```
   make qemu
   ```

 ## 我们的工作

   - 调试操作系统启动的引导程序,使得操作系统多核启动能够顺利执行.
   - 调试UART机器和对应的控制台输入输出函数,使得操作系统能够正常进行键盘输入.
   - 调试底层文件系统接口,使用RAM来模拟磁盘.
   - 调试FAT32文件系统,为用户程序提供稳定的文件操作接口.

 ## 可用分支

   `main`分支:操作系统stable版本
