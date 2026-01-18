## 1. What is a partition ?

- Partitioning is a means to divide a single hard drive into many logical drivers. A partition is a contifuous set of blocks on a drive that are treated as an independent disk.

## A partition table is an index that relates sections of the hard drive to partitions.

The Structure of Disk Partition

- On the disk where O/S is installed, will have the first partition as MBR/GPT.
- MBR is a master Boot Record, which contains two important utilities, Ipl (Initial Program Loader)
  and PTI (Partition Table information). which supports up to 2 TB of disk size
- GPT is GUID Partition Table, which alos contains IPL as well as PTI, supports up to 2 Zettabyte
- UPL is responsible for booting the operating the system, because it contains the boot loader.
- In PTI (partition Table information) is the information about the number of partitions on the disk, sizes of the partition and types of partitions
