class WigglyBullet extends Bullet
{
  PVector shootLoc, wiggleVel;
  int wiggleAmount, wiggleChangeTime;
  float rotateAmount;
  boolean hasWiggled;

  WigglyBullet(PVector shootLoc, PVector wiggleVel, PVector vel, PVector loc, int bulletSize, int damage, int range, int wiggleAmount, int wiggleChangeTime, float rotateAmount, float speed, boolean madeByPlayer, boolean exists, boolean piercing)
  {
    super(vel, loc, bulletSize, damage, speed, madeByPlayer, exists, piercing);
    this.shootLoc = shootLoc;
    this.wiggleVel = wiggleVel;
    this.wiggleAmount = wiggleAmount;
    this.wiggleChangeTime = wiggleChangeTime;
    this.rotateAmount = rotateAmount;
    this.hasWiggled = false;
  }

  void show()
  {
    fill(0);
    super.show();
  }

  void run()
  {
    vel.limit(speed);
    if (millis() - wiggleChangeTime - pauseTime >= wiggleChangeTime)
    {
      float m = wiggleAmount;
      float a = vel.heading2D();
      if (!hasWiggled)
      {
        a += rotateAmount / 2;
        hasWiggled = true;
        wiggleVel.x = m * cos(a);
        wiggleVel.y = m * sin(a);
      } else 
      {
        a = wiggleVel.heading2D();
        a += rotateAmount;
        wiggleVel.x = m * cos(a);
        wiggleVel.y = m * sin(a);
      }
      wiggleChangeTime = millis() - pauseTime;
    }
    loc.add(wiggleVel);
    loc.add(vel);
  }
}
