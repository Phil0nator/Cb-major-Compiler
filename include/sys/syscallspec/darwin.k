
#ifndef _SYS_SYSCALL_H_
#define	_SYS_SYSCALL_H_

#define	SYS_MAXSYSCALL	370

#define SYS_exit 33554433
#define SYS_fork 33554434
#define SYS_read 33554435
#define SYS_write 33554436
#define SYS_open 33554437
#define SYS_close 33554438
#define SYS_wait4 33554439
#define SYS_link 33554441
#define SYS_unlink 33554442
#define SYS_chdir 33554444
#define SYS_fchdir 33554445
#define SYS_mknod 33554446
#define SYS_chmod 33554447
#define SYS_chown 33554448
#define SYS_getfsstat 33554450
#define SYS_getpid 33554452
#define SYS_setuid 33554455
#define SYS_getuid 33554456
#define SYS_geteuid 33554457
#define SYS_ptrace 33554458
#define SYS_recvmsg 33554459
#define SYS_sendmsg 33554460
#define SYS_recvfrom 33554461
#define SYS_accept 33554462
#define SYS_getpeername 33554463
#define SYS_getsockname 33554464

#define SYS_access 33554465
#define SYS_chflags 33554466
#define SYS_fchflags 33554467
#define SYS_sync 33554468
#define SYS_kill 33554469
#define SYS_getppid 33554471
#define SYS_dup 33554473
#define SYS_pipe 33554474
#define SYS_getegid 33554475
#define SYS_sigaction 33554478
#define SYS_getgid 33554479
#define SYS_sigprocmask 33554480
#define SYS_getlogin 33554481
#define SYS_setlogin 33554482
#define SYS_acct 33554483
#define SYS_sigpending 33554484
#define SYS_sigaltstack 33554485
#define SYS_ioctl 33554486
#define SYS_reboot 33554487
#define SYS_revoke 33554488
#define SYS_symlink 33554489
#define SYS_readlink 33554490
#define SYS_execve 33554491
#define SYS_umask 33554492
#define SYS_chroot 33554493
#define SYS_msync 33554497
#define SYS_vfork 33554498
#define SYS_munmap 33554505
#define SYS_mprotect 33554506
#define SYS_madvise 33554507
#define SYS_mincore 33554510
#define SYS_getgroups 33554511
#define SYS_setgroups 33554512
#define SYS_getpgrp 33554513
#define SYS_setpgid 33554514
#define SYS_setitimer 33554515
#define SYS_swapon 33554517
#define SYS_getitimer 33554518
#define SYS_getdtablesize 33554521
#define SYS_dup2 33554522
#define SYS_fcntl 33554524
#define SYS_select 33554525
#define SYS_fsync 33554527
#define SYS_setpriority 33554528
#define SYS_socket 33554529
#define SYS_connect 33554530
#define SYS_getpriority 33554532
#define SYS_bind 33554536
#define SYS_setsockopt 33554537
#define SYS_listen 33554538
#define SYS_sigsuspend 33554543
#define SYS_gettimeofday 33554548
#define SYS_getrusage 33554549
#define SYS_getsockopt 33554550
#define SYS_readv 33554552
#define SYS_writev 33554553
#define SYS_settimeofday 33554554
#define SYS_fchown 33554555
#define SYS_fchmod 33554556
#define SYS_setreuid 33554558
#define SYS_setregid 33554559
#define SYS_rename 33554560
#define SYS_flock 33554563
#define SYS_mkfifo 33554564
#define SYS_sendto 33554565
#define SYS_shutdown 33554566
#define SYS_socketpair 33554567
#define SYS_mkdir 33554568
#define SYS_rmdir 33554569
#define SYS_utimes 33554570
#define SYS_futimes 33554571
#define SYS_adjtime 33554572
#define SYS_gethostuuid 33554574
#define SYS_setsid 33554579
#define SYS_getpgid 33554583
#define SYS_setprivexec 33554584
#define SYS_pread 33554585
#define SYS_pwrite 33554586
#define SYS_nfssvc 33554587
#define SYS_statfs 33554589
#define SYS_fstatfs 33554590
#define SYS_unmount 33554591
#define SYS_quotactl 33554597
#define SYS_mount 33554599
#define SYS_csops 33554601
#define SYS_csops_audittoken 33554602
#define SYS_waitid 33554605
#define SYS_kdebug_typefilter 33554609
#define SYS_kdebug_trace_string 33554610
#define SYS_kdebug_trace64 33554611
#define SYS_kdebug_trace 33554612
#define SYS_setgid 33554613
#define SYS_setegid 33554614
#define SYS_seteuid 33554615
#define SYS_sigreturn 33554616
#define SYS_thread_selfcounts 33554618
#define SYS_fdatasync 33554619
#define SYS_stat 33554620
#define SYS_fstat 33554621
#define SYS_lstat 33554622
#define SYS_pathconf 33554623
#define SYS_fpathconf 33554624
#define SYS_getrlimit 33554626
#define SYS_setrlimit 33554627
#define SYS_getdirentries 33554628
#define SYS_mmap 33554629
#define SYS_lseek 33554631
#define SYS_truncate 33554632
#define SYS_ftruncate 33554633
#define SYS_sysctl 33554634
#define SYS_mlock 33554635
#define SYS_munlock 33554636
#define SYS_undelete 33554637
#define SYS_open_dprotected_np 33554648
#define SYS_getattrlist 33554652
#define SYS_setattrlist 33554653
#define SYS_getdirentriesattr 33554654
#define SYS_exchangedata 33554655
#define SYS_searchfs 33554657
#define SYS_delete 33554658
#define SYS_copyfile 33554659
#define SYS_fgetattrlist 33554660
#define SYS_fsetattrlist 33554661
#define SYS_poll 33554662
#define SYS_watchevent 33554663
#define SYS_waitevent 33554664
#define SYS_modwatch 33554665
#define SYS_getxattr 33554666
#define SYS_fgetxattr 33554667
#define SYS_setxattr 33554668
#define SYS_fsetxattr 33554669
#define SYS_removexattr 33554670
#define SYS_fremovexattr 33554671
#define SYS_listxattr 33554672
#define SYS_flistxattr 33554673
#define SYS_fsctl 33554674
#define SYS_initgroups 33554675
#define SYS_posix_spawn 33554676
#define SYS_ffsctl 33554677
#define SYS_minherit 33554682
#define SYS_semsys 33554683
#define SYS_msgsys 33554684
#define SYS_shmsys 33554685
#define SYS_semctl 33554686
#define SYS_semget 33554687
#define SYS_semop 33554688
#define SYS_msgctl 33554690
#define SYS_msgget 33554691
#define SYS_msgsnd 33554692
#define SYS_msgrcv 33554693
#define SYS_shmat 33554694
#define SYS_shmctl 33554695
#define SYS_shmdt 33554696
#define SYS_shmget 33554697
#define SYS_shm_open 33554698
#define SYS_shm_unlink 33554699
#define SYS_sem_open 33554700
#define SYS_sem_close 33554701
#define SYS_sem_unlink 33554702
#define SYS_sem_wait 33554703
#define SYS_sem_trywait 33554704
#define SYS_sem_post 33554705
#define SYS_sysctlbyname 33554706
#define SYS_open_extended 33554709
#define SYS_umask_extended 33554710
#define SYS_stat_extended 33554711
#define SYS_lstat_extended 33554712
#define SYS_fstat_extended 33554713
#define SYS_chmod_extended 33554714
#define SYS_fchmod_extended 33554715
#define SYS_access_extended 33554716
#define SYS_settid 33554717
#define SYS_gettid 33554718
#define SYS_setsgroups 33554719
#define SYS_getsgroups 33554720
#define SYS_setwgroups 33554721
#define SYS_getwgroups 33554722
#define SYS_mkfifo_extended 33554723
#define SYS_mkdir_extended 33554724
#define SYS_identitysvc 33554725
#define SYS_shared_region_check_np 33554726
#define SYS_vm_pressure_monitor 33554728
#define SYS_psynch_rw_longrdlock 33554729
#define SYS_psynch_rw_yieldwrlock 33554730
#define SYS_psynch_rw_downgrade 33554731
#define SYS_psynch_rw_upgrade 33554732
#define SYS_psynch_mutexwait 33554733
#define SYS_psynch_mutexdrop 33554734
#define SYS_psynch_cvbroad 33554735
#define SYS_psynch_cvsignal 33554736
#define SYS_psynch_cvwait 33554737
#define SYS_psynch_rw_rdlock 33554738
#define SYS_psynch_rw_wrlock 33554739
#define SYS_psynch_rw_unlock 33554740
#define SYS_psynch_rw_unlock2 33554741
#define SYS_getsid 33554742
#define SYS_settid_with_pid 33554743
#define SYS_psynch_cvclrprepost 33554744
#define SYS_aio_fsync 33554745
#define SYS_aio_return 33554746
#define SYS_aio_suspend 33554747
#define SYS_aio_cancel 33554748
#define SYS_aio_error 33554749
#define SYS_aio_read 33554750
#define SYS_aio_write 33554751
#define SYS_lio_listio 33554752
#define SYS_iopolicysys 33554754
#define SYS_process_policy 33554755
#define SYS_mlockall 33554756
#define SYS_munlockall 33554757
#define SYS_issetugid 33554759
#define SYS___pthread_kill 33554760
#define SYS___pthread_sigmask 33554761
#define SYS___sigwait 33554762
#define SYS___disable_threadsignal 33554763
#define SYS___pthread_markcancel 33554764
#define SYS___pthread_canceled 33554765
#define SYS___semwait_signal 33554766
#define SYS_proc_info 33554768
#define SYS_sendfile 33554769
#define SYS_stat64 33554770
#define SYS_fstat64 33554771
#define SYS_lstat64 33554772
#define SYS_stat64_extended 33554773
#define SYS_lstat64_extended 33554774
#define SYS_fstat64_extended 33554775
#define SYS_getdirentries64 33554776
#define SYS_statfs64 33554777
#define SYS_fstatfs64 33554778
#define SYS_getfsstat64 33554779
#define SYS___pthread_chdir 33554780
#define SYS___pthread_fchdir 33554781
#define SYS_audit 33554782
#define SYS_auditon 33554783
#define SYS_getauid 33554785
#define SYS_setauid 33554786
#define SYS_getaudit_addr 33554789
#define SYS_setaudit_addr 33554790
#define SYS_auditctl 33554791
#define SYS_bsdthread_create 33554792
#define SYS_bsdthread_terminate 33554793
#define SYS_kqueue 33554794
#define SYS_kevent 33554795
#define SYS_lchown 33554796
#define SYS_bsdthread_register 33554798
#define SYS_workq_open 33554799
#define SYS_workq_kernreturn 33554800
#define SYS_kevent64 33554801
#define SYS___old_semwait_signal 33554802
#define SYS___old_semwait_signal_nocancel 33554803
#define SYS_thread_selfid 33554804
#define SYS_ledger 33554805
#define SYS_kevent_qos 33554806
#define SYS_kevent_id 33554807
#define SYS___mac_execve 33554812

#define SYS___mac_syscall 33554813
#define SYS___mac_get_file 33554814
#define SYS___mac_set_file 33554815
#define SYS___mac_get_link 33554816
#define SYS___mac_set_link 33554817
#define SYS___mac_get_proc 33554818
#define SYS___mac_set_proc 33554819
#define SYS___mac_get_fd 33554820
#define SYS___mac_set_fd 33554821
#define SYS___mac_get_pid 33554822


#define SYS_pselect 33554826
#define SYS_pselect_nocancel 33554827
#define SYS_read_nocancel 33554828
#define SYS_write_nocancel 33554829
#define SYS_open_nocancel 33554830
#define SYS_close_nocancel 33554831
#define SYS_wait4_nocancel 33554832

#define SYS_recvmsg_nocancel 33554833
#define SYS_sendmsg_nocancel 33554834
#define SYS_recvfrom_nocancel 33554835
#define SYS_accept_nocancel 33554836

 /* SOCKETS */
#define SYS_msync_nocancel 33554837
#define SYS_fcntl_nocancel 33554838
#define SYS_select_nocancel 33554839
#define SYS_fsync_nocancel 33554840

#define SYS_connect_nocancel 33554841

 /* SOCKETS */
#define SYS_sigsuspend_nocancel 33554842
#define SYS_readv_nocancel 33554843
#define SYS_writev_nocancel 33554844

#define SYS_sendto_nocancel 33554845

 /* SOCKETS */
#define SYS_pread_nocancel 33554846
#define SYS_pwrite_nocancel 33554847
#define SYS_waitid_nocancel 33554848
#define SYS_poll_nocancel 33554849

#define SYS_msgsnd_nocancel 33554850
#define SYS_msgrcv_nocancel 33554851


#define SYS_sem_wait_nocancel 33554852
#define SYS_aio_suspend_nocancel 33554853
#define SYS___sigwait_nocancel 33554854
#define SYS___semwait_signal_nocancel 33554855
#define SYS___mac_mount 33554856

#define SYS___mac_get_mount 33554857


#define SYS___mac_getfsstat 33554858
#define SYS_fsgetpath 33554859
#define SYS_audit_session_self 33554860
#define SYS_audit_session_join 33554861
#define SYS_fileport_makeport 33554862
#define SYS_fileport_makefd 33554863
#define SYS_audit_session_port 33554864
#define SYS_pid_suspend 33554865
#define SYS_pid_resume 33554866

#define SYS_pid_hibernate 33554867



#define SYS_pid_shutdown_sockets 33554868


#define SYS_shared_region_map_and_slide_np 33554870
#define SYS_kas_info 33554871

#define SYS_memorystatus_control 33554872


#define SYS_guarded_open_np 33554873
#define SYS_guarded_close_np 33554874
#define SYS_guarded_kqueue_np 33554875
#define SYS_change_fdguard_np 33554876
#define SYS_usrctl 33554877
#define SYS_proc_rlimit_control 33554878

#define SYS_connectx 33554879
#define SYS_disconnectx 33554880
#define SYS_peeloff 33554881
#define SYS_socket_delegate 33554882

 /* SOCKETS */
#define SYS_telemetry 33554883

#define SYS_proc_uuid_policy 33554884



#define SYS_memorystatus_get_level 33554885


#define SYS_system_override 33554886
#define SYS_vfs_purge 33554887
#define SYS_sfi_ctl 33554888
#define SYS_sfi_pidctl 33554889

#define SYS_coalition 33554890
#define SYS_coalition_info 33554891

 /* COALITIONS */

#define SYS_necp_match_policy 33554892

 /* NECP */
#define SYS_getattrlistbulk 33554893
#define SYS_clonefileat 33554894
#define SYS_openat 33554895
#define SYS_openat_nocancel 33554896
#define SYS_renameat 33554897
#define SYS_faccessat 33554898
#define SYS_fchmodat 33554899
#define SYS_fchownat 33554900
#define SYS_fstatat 33554901
#define SYS_fstatat64 33554902
#define SYS_linkat 33554903
#define SYS_unlinkat 33554904
#define SYS_readlinkat 33554905
#define SYS_symlinkat 33554906
#define SYS_mkdirat 33554907
#define SYS_getattrlistat 33554908
#define SYS_proc_trace_log 33554909
#define SYS_bsdthread_ctl 33554910
#define SYS_openbyid_np 33554911

#define SYS_recvmsg_x 33554912
#define SYS_sendmsg_x 33554913

 /* SOCKETS */
#define SYS_thread_selfusage 33554914

#define SYS_csrctl 33554915

 /* CSR */
#define SYS_guarded_open_dprotected_np 33554916
#define SYS_guarded_write_np 33554917
#define SYS_guarded_pwrite_np 33554918
#define SYS_guarded_writev_np 33554919
#define SYS_renameatx_np 33554920

#define SYS_mremap_encrypted 33554921



#define SYS_netagent_trigger 33554922

 /* NETWORKING */
#define SYS_stack_snapshot_with_config 33554923

#define SYS_microstackshot 33554924

 /* CONFIG_TELEMETRY */

#define SYS_grab_pgo_data 33554925



#define SYS_persona 33554926


#define SYS_work_interval_ctl 33554931
#define SYS_getentropy 33554932

#define SYS_necp_open 33554933
#define SYS_necp_client_action 33554934

 /* NECP */
#define SYS_ulock_wait 33554947
#define SYS_ulock_wake 33554948
#define SYS_fclonefileat 33554949
#define SYS_fs_snapshot 33554950
#define SYS_terminate_with_payload 33554952
#define SYS_abort_with_payload 33554953

#define SYS_necp_session_open 33554954
#define SYS_necp_session_action 33554955
 /* NECP */
 /* NECP */
#define SYS_setattrlistat 33554956
#define SYS_net_qos_guideline 33554957
#define SYS_fmount 33554958
#define SYS_ntp_adjtime 33554959
#define SYS_ntp_gettime 33554960
#define SYS_os_fault_with_payload 33554961

#define SYS_kqueue_workloop_ctl 33554962

 // CONFIG_WORKQUEUE













#endif/* !_SYS_SYSCALL_H_ */