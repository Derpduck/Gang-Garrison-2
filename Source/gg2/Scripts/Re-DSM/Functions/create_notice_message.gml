var notice;
with NoticeO instance_destroy();
notice = instance_create(0, 0, NoticeO);
notice.notice = NOTICE_CUSTOM;
notice.message = argument0;

// Play a unique sound when freeze time ends, compatible with the original plugin
if (argument0 == "Round is live!" or argument0 == "Spawn doors are open! Fight!")
{
    playsound(view_xview[0] + (view_wview[0] / 2),view_yview[0] + (view_hview[0] / 2), DeathCamSnd);
}
