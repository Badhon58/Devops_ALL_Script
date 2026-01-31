**_22nd Session AWS - EC2 Instance, EBS Snapshot Standard & Archive Tier, FSR (Fast Snapshot Restore)_**

### Snap Short

- Snapshot is a point in time copy of the Volume
- Backup of the Volume is called Snapshot
- EBS Snapshot are created from EBS Volumes
- You can create SnapShots from Volumes
- EBS Volumes -> EBS Snapshots -> EBS Volumes
- You Can't attach a snapshot directly to the EC2 instance, you have to create a volume and attach it to the EC2 instance.
- It is not possible to login to the SnapShot directly
- SnapShots are Stored in s3 (Provider S3)
- SnapShot are visible from the EC2 console
- Snapshot doesn't have any AZ
- Snapshots are Regional
- By default, Snapshots are private, if required we can make it public
- you can copy the snapshot from one region to another region in the same account
- Snapshots can be shared from one AWS account to another AWS account (Private)
- EBS Volumes can't be moved directly to any AZ, instead create snapshot.
- EBS Volumes are created from SnapShort
- Instance store volumes are created from a template stored in S3
- To create a snapshot we no need to STOP the ec2 instance
- Data Life Cycle Manager : It is used to take the snapshots automatically/schedule.
- Volumes that should get snapshot will be identified by tags

### EBS Snapshot Standard and Archive tier

- Move the snapshot to an archive tier that is 75% cheaper
- Takes 24 to 72 hours for restoring from archive

### Recycle Bin

- Setup rules to retain deleted snapshots so you can recover them after accidental deletion, (Retention period 1 day to 1 years)

### Fast SnapShot Restore(FSR)

Force full initialization of snapshot to have no latency on the first use
By default volumes, snapshots are not encrypted description is handles by aws
Not Encrypted -> Not Encrypted

---

### IMAGE

- Copy of the OS is called Image
- Image = AMI = Amazon machine Image

- Key pair is used to retrieve the password
- key pair is the combination of private and public key
