// Hanoi Tower  by YanwarsArief
// Monggo di Edit sesuai Keperluan
// Kodingna Tembak Amburadul & Logikana ngan ngandalkn Percabangan  nu simple2 weh
// 17:27 12.11.2013
// rev 10:59 15.11.2013
// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

unit HanoiTower;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, jpeg, Buttons, StrUtils, MMSystem, acPNG;

type
  TForm2 = class(TForm)
    Timer1: TTimer;
    Timer2: TTimer;
    Timer3: TTimer;
    Label1: TLabel;
    lblPerintah: TLabel;
    Label2: TLabel;
    Image1: TImage;
    Panel1: TPanel;
    sp_B: TSpeedButton;
    sp_A: TSpeedButton;
    shAlas: TShape;
    shtiang_B: TShape;
    shtiang_C: TShape;
    shblk_3: TShape;
    shblk_3b: TShape;
    shblk_2: TShape;
    shblk_2b: TShape;
    shblk_1: TShape;
    shblk_1b: TShape;
    shtiang_A: TShape;
    sp_C: TSpeedButton;
    Panel2: TPanel;
    sp_screen: TSpeedButton;
    SpeedButton1: TSpeedButton;
    sp_Reset: TSpeedButton;
    lbl_langkah: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure sp_AClick(Sender: TObject);
    procedure sp_BClick(Sender: TObject);
    procedure sp_CClick(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure sp_ResetClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure sp_screenClick(Sender: TObject);

  private
    { Private declarations }
    procedure PosisiAwal();

  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  str_tiang: string;
  str_pindahke: string;
  int_tiang: integer;
  int_terbawah: integer;
  int_tengah1, int_tengah2, int_tengah3, int_tengah4: integer;
  int_teratas: integer;
  int_jarak: integer;
  int_tinggiblk: integer;
  int_tinggitiang: integer;
  int_atastiang: integer;
  int_langkah: integer;
  str_IsiA, str_IsiB, str_IsiC: string;
  str_perintah: string;

implementation

{$R *.dfm}

procedure TForm2.PosisiAwal();
begin
  int_langkah := 0;
  int_jarak := 5;
  int_tinggiblk := 40;
  int_tinggitiang := shtiang_A.Height;
  int_atastiang := shtiang_A.Top;
  shAlas.Top:=int_atastiang+int_tinggitiang-int_jarak;
  str_IsiA := '1B1A2B2A3B3A';
  str_IsiB := '';
  str_IsiC := '';
  lbl_langkah.Caption := '';
  Panel1.Top:=(Form2.Height div 2) - (panel1.Height div 2) ;
  Panel1.Left:=(Form2.Width div 2) - (panel1.Width div 2);

  shblk_1.Height := int_tinggiblk;
  shblk_2.Height := int_tinggiblk;
  shblk_3.Height := int_tinggiblk;

  shblk_1b.Height := int_tinggiblk;
  shblk_2b.Height := int_tinggiblk;
  shblk_3b.Height := int_tinggiblk;

  shtiang_A.Top := int_atastiang;
  shtiang_B.Top := int_atastiang;
  shtiang_C.Top := int_atastiang;

  if str_tiang = 'A' then
    int_tiang := shtiang_A.Left + (shtiang_A.Width div 2)
  else if str_tiang = 'B' then
    int_tiang := shtiang_B.Left + (shtiang_B.Width div 2)
  else if str_tiang = 'C' then
    int_tiang := shtiang_C.Left + (shtiang_C.Width div 2);

  shblk_1.Left := int_tiang - (shblk_1.Width div 2);
  shblk_2.Left := int_tiang - (shblk_2.Width div 2);
  shblk_3.Left := int_tiang - (shblk_3.Width div 2);

  shblk_1b.Left := int_tiang - (shblk_1b.Width div 2);
  shblk_2b.Left := int_tiang - (shblk_2b.Width div 2);
  shblk_3b.Left := int_tiang - (shblk_3b.Width div 2);

  int_terbawah := shtiang_A.Top + int_tinggitiang - int_jarak;
  int_tengah1 := int_terbawah - int_tinggiblk - int_jarak;
  int_tengah2 := int_tengah1 - int_tinggiblk - int_jarak;
  int_tengah3 := int_tengah2 - int_tinggiblk - int_jarak;
  int_tengah4 := int_tengah3 - int_tinggiblk - int_jarak;
  int_teratas := int_tengah4 - int_tinggiblk - int_jarak;

  shblk_3.Top := int_terbawah - int_tinggiblk - int_jarak;
  shblk_3.Tag := 3; // posisi paling bawah

  shblk_3b.Top := int_tengah1 - int_tinggiblk - int_jarak;
  shblk_3b.Tag := 3; // posisisi tengah

  shblk_2.Top := int_tengah2 - int_tinggiblk - int_jarak;
  shblk_2.Tag := 2; // posisisi tengah

  shblk_2b.Top := int_tengah3 - int_tinggiblk - int_jarak;
  shblk_2b.Tag := 2; // posisisi tengah

  shblk_1.Top := int_tengah4 - int_tinggiblk - int_jarak;
  shblk_1.Tag := 1; // posisisi tengah

  shblk_1b.Top := int_teratas - int_tinggiblk - int_jarak;
  shblk_1b.Tag := 1; // posisi paling atas

  lblPerintah.Caption :=
    'Pindahkan balok warna Merah ke posisi B dan balok warna Biru ke C';
end;

procedure TForm2.SpeedButton1Click(Sender: TObject);
begin
Application.Terminate;

end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  str_tiang := 'A';
  sp_screenClick(Self);
  PosisiAwal;
end;

procedure TForm2.sp_AClick(Sender: TObject);
begin
  if (Timer1.Enabled = true) Or (Timer2.Enabled = true) or
    (Timer3.Enabled = true) then
    exit;
  if (str_tiang = 'A') or (str_tiang = 'PILIHTIANG') then
  begin
    if Length(str_IsiA) = 0 then
      exit;
    str_tiang := 'A';
    sp_A.Enabled := False;
  end
  else
  begin
    str_pindahke := 'A';
    int_langkah := int_langkah + 1;
    Timer1.Enabled := true;
  end;

  // PlaySound('sound.wav',0,SND_FILENAME);
end;

procedure TForm2.sp_BClick(Sender: TObject);
begin
  if (Timer1.Enabled = true) Or (Timer2.Enabled = true) or
    (Timer3.Enabled = true) then
    exit;
  if (str_tiang = 'B') or (str_tiang = 'PILIHTIANG') then
  begin
    if Length(str_IsiB) = 0 then
      exit;
    str_tiang := 'B';
    sp_B.Enabled := False;
  end
  else
  begin
    str_pindahke := 'B';
    int_langkah := int_langkah + 1;
    Timer1.Enabled := true;
  end;
  // PlaySound('sound.wav',0,SND_FILENAME);  // aktifken mun hoyong make sound ...
end;

procedure TForm2.sp_CClick(Sender: TObject);
begin
  if (Timer1.Enabled = true) Or (Timer2.Enabled = true) or
    (Timer3.Enabled = true) then
    exit;
  if (str_tiang = 'C') or (str_tiang = 'PILIHTIANG') then
  begin
    if Length(str_IsiC) = 0 then
      exit;
    str_tiang := 'C';
    sp_C.Enabled := False;
  end
  else
  begin
    str_pindahke := 'C';
    int_langkah := int_langkah + 1;
    Timer1.Enabled := true;
  end;

  // PlaySound('sound.wav',0,SND_FILENAME);
end;

procedure TForm2.sp_ResetClick(Sender: TObject);
begin
  str_tiang := 'A';
  PosisiAwal;
end;

procedure TForm2.sp_screenClick(Sender: TObject);
begin
  if sp_screen.Tag=0 then
    begin
      Form2.BorderStyle:=bsNone;
      form2.left:=0;
      form2.top:=0;
      form2.Width:=Screen.Width;
      form2.Height:=Screen.Height;
      sp_screen.Caption:='NormalScreen';
      sp_screen.Tag:=1;
    end
  else if sp_screen.Tag=1 then
  begin

      Form2.BorderStyle:=bsSingle;
      form2.Width:=1000;
      form2.Height:=622;
      form2.Top:=(Screen.Height div 2) - (Form2.Height div 2);
      form2.left:=(Screen.Width div 2) - (Form2.Width div 2);
      sp_screen.Caption:='FullScreen';
      sp_screen.Tag:=0;
  end;

end;

procedure TForm2.Timer1Timer(Sender: TObject);
begin

  if str_tiang = 'A' then
  begin
    if Copy(str_IsiA, 1, 2) = '1A' then
    begin

      if shblk_1.Top > (int_atastiang - int_tinggiblk - int_jarak) then
        shblk_1.Top := shblk_1.Top - 10
      else
      begin
        shblk_1.Top := (int_atastiang - int_tinggiblk - int_jarak);
        Timer2.Enabled := true;
        Timer1.Enabled := False;
      end;
    end
    else if Copy(str_IsiA, 1, 2) = '1B' then
    begin

      if shblk_1b.Top > (int_atastiang - int_tinggiblk - int_jarak) then
        shblk_1b.Top := shblk_1b.Top - 10
      else
      begin
        shblk_1b.Top := (int_atastiang - int_tinggiblk - int_jarak);
        Timer2.Enabled := true;
        Timer1.Enabled := False;
      end;
    end

    else if Copy(str_IsiA, 1, 2) = '2A' then
    begin

      if shblk_2.Top > (int_atastiang - int_tinggiblk - int_jarak) then
        shblk_2.Top := shblk_2.Top - 10
      else
      begin
        shblk_2.Top := (int_atastiang - int_tinggiblk - int_jarak);
        Timer2.Enabled := true;
        Timer1.Enabled := False;
      end;
    end

    else if Copy(str_IsiA, 1, 2) = '2B' then
    begin

      if shblk_2b.Top > (int_atastiang - int_tinggiblk - int_jarak) then
        shblk_2b.Top := shblk_2b.Top - 10
      else
      begin
        shblk_2b.Top := (int_atastiang - int_tinggiblk - int_jarak);
        Timer2.Enabled := true;
        Timer1.Enabled := False;
      end;
    end

    else if Copy(str_IsiA, 1, 2) = '3A' then
    begin

      if shblk_3.Top > (int_atastiang - int_tinggiblk - int_jarak) then
        shblk_3.Top := shblk_3.Top - 10
      else
      begin
        shblk_3.Top := (int_atastiang - int_tinggiblk - int_jarak);
        Timer2.Enabled := true;
        Timer1.Enabled := False;
      end;
    end
    else if Copy(str_IsiA, 1, 2) = '3B' then
    begin

      if shblk_3b.Top > (int_atastiang - int_tinggiblk - int_jarak) then
        shblk_3b.Top := shblk_3b.Top - 10
      else
      begin
        shblk_3b.Top := (int_atastiang - int_tinggiblk - int_jarak);
        Timer2.Enabled := true;
        Timer1.Enabled := False;
      end;
    end;

  end

  else if str_tiang = 'C' then
  begin
    if Copy(str_IsiC, 1, 2) = '1A' then
    begin

      if shblk_1.Top > (int_atastiang - int_tinggiblk - int_jarak) then
        shblk_1.Top := shblk_1.Top - 10
      else
      begin
        shblk_1.Top := (int_atastiang - int_tinggiblk - int_jarak);
        Timer2.Enabled := true;
        Timer1.Enabled := False;
      end;
    end

    else if Copy(str_IsiC, 1, 2) = '1B' then
    begin

      if shblk_1b.Top > (int_atastiang - int_tinggiblk - int_jarak) then
        shblk_1b.Top := shblk_1b.Top - 10
      else
      begin
        shblk_1b.Top := (int_atastiang - int_tinggiblk - int_jarak);
        Timer2.Enabled := true;
        Timer1.Enabled := False;
      end;
    end

    else if Copy(str_IsiC, 1, 2) = '2A' then
    begin

      if shblk_2.Top > (int_atastiang - int_tinggiblk - int_jarak) then
        shblk_2.Top := shblk_2.Top - 10
      else
      begin
        shblk_2.Top := (int_atastiang - int_tinggiblk - int_jarak);
        Timer2.Enabled := true;
        Timer1.Enabled := False;
      end;
    end

    else if Copy(str_IsiC, 1, 2) = '2B' then
    begin

      if shblk_2b.Top > (int_atastiang - int_tinggiblk - int_jarak) then
        shblk_2b.Top := shblk_2b.Top - 10
      else
      begin
        shblk_2b.Top := (int_atastiang - int_tinggiblk - int_jarak);
        Timer2.Enabled := true;
        Timer1.Enabled := False;
      end;
    end

    else if Copy(str_IsiC, 1, 2) = '3A' then
    begin

      if shblk_3.Top > (int_atastiang - int_tinggiblk - int_jarak) then
        shblk_3.Top := shblk_3.Top - 10
      else
      begin
        shblk_3.Top := (int_atastiang - int_tinggiblk - int_jarak);
        Timer2.Enabled := true;
        Timer1.Enabled := False;
      end;
    end

    else if Copy(str_IsiC, 1, 2) = '3B' then
    begin

      if shblk_3b.Top > (int_atastiang - int_tinggiblk - int_jarak) then
        shblk_3b.Top := shblk_3b.Top - 10
      else
      begin
        shblk_3b.Top := (int_atastiang - int_tinggiblk - int_jarak);
        Timer2.Enabled := true;
        Timer1.Enabled := False;
      end;
    end;
  end
  else if str_tiang = 'B' then
    if str_pindahke = 'A' then
    begin
      if Copy(str_IsiB, 1, 2) = '1A' then
      begin

        if shblk_1.Top > (int_atastiang - int_tinggiblk - int_jarak) then
          shblk_1.Top := shblk_1.Top - 10
        else
        begin
          shblk_1.Top := (int_atastiang - int_tinggiblk - int_jarak);
          Timer2.Enabled := true;
          Timer1.Enabled := False;
        end;
      end

      else if Copy(str_IsiB, 1, 2) = '1B' then
      begin

        if shblk_1b.Top > (int_atastiang - int_tinggiblk - int_jarak) then
          shblk_1b.Top := shblk_1b.Top - 10
        else
        begin
          shblk_1b.Top := (int_atastiang - int_tinggiblk - int_jarak);
          Timer2.Enabled := true;
          Timer1.Enabled := False;
        end;
      end

      else if Copy(str_IsiB, 1, 2) = '2A' then
      begin

        if shblk_2.Top > (int_atastiang - int_tinggiblk - int_jarak) then
          shblk_2.Top := shblk_2.Top - 10
        else
        begin
          shblk_2.Top := (int_atastiang - int_tinggiblk - int_jarak);
          Timer2.Enabled := true;
          Timer1.Enabled := False;
        end;
      end

      else if Copy(str_IsiB, 1, 2) = '2B' then
      begin

        if shblk_2b.Top > (int_atastiang - int_tinggiblk - int_jarak) then
          shblk_2b.Top := shblk_2b.Top - 10
        else
        begin
          shblk_2b.Top := (int_atastiang - int_tinggiblk - int_jarak);
          Timer2.Enabled := true;
          Timer1.Enabled := False;
        end;
      end

      else if Copy(str_IsiB, 1, 2) = '3A' then
      begin

        if shblk_3.Top > (int_atastiang - int_tinggiblk - int_jarak) then
          shblk_3.Top := shblk_3.Top - 10
        else
        begin
          shblk_3.Top := (int_atastiang - int_tinggiblk - int_jarak);
          Timer2.Enabled := true;
          Timer1.Enabled := False;
        end;
      end

      else if Copy(str_IsiB, 1, 2) = '3B' then
      begin

        if shblk_3b.Top > (int_atastiang - int_tinggiblk - int_jarak) then
          shblk_3b.Top := shblk_3b.Top - 10
        else
        begin
          shblk_3b.Top := (int_atastiang - int_tinggiblk - int_jarak);
          Timer2.Enabled := true;
          Timer1.Enabled := False;
        end;
      end;
    end

    else if str_pindahke = 'C' then
    begin
      if Copy(str_IsiB, 1, 2) = '1A' then
      begin

        if shblk_1.Top > (int_atastiang - int_tinggiblk - int_jarak) then
          shblk_1.Top := shblk_1.Top - 10
        else
        begin
          shblk_1.Top := (int_atastiang - int_tinggiblk - int_jarak);
          Timer2.Enabled := true;
          Timer1.Enabled := False;
        end;
      end

      else if Copy(str_IsiB, 1, 2) = '1B' then
      begin

        if shblk_1b.Top > (int_atastiang - int_tinggiblk - int_jarak) then
          shblk_1b.Top := shblk_1b.Top - 10
        else
        begin
          shblk_1b.Top := (int_atastiang - int_tinggiblk - int_jarak);
          Timer2.Enabled := true;
          Timer1.Enabled := False;
        end;
      end

      else if Copy(str_IsiB, 1, 2) = '2A' then
      begin
        if shblk_2.Top > (int_atastiang - int_tinggiblk - int_jarak) then
          shblk_2.Top := shblk_2.Top - 10
        else
        begin
          shblk_2.Top := (int_atastiang - int_tinggiblk - int_jarak);
          Timer2.Enabled := true;
          Timer1.Enabled := False;
        end;
      end

      else if Copy(str_IsiB, 1, 2) = '2B' then
      begin
        if shblk_2b.Top > (int_atastiang - int_tinggiblk - int_jarak) then
          shblk_2b.Top := shblk_2b.Top - 10
        else
        begin
          shblk_2b.Top := (int_atastiang - int_tinggiblk - int_jarak);
          Timer2.Enabled := true;
          Timer1.Enabled := False;
        end;
      end

      else if Copy(str_IsiB, 1, 2) = '3A' then
      begin
        if shblk_3.Top > (int_atastiang - int_tinggiblk - int_jarak) then
          shblk_3.Top := shblk_3.Top - 10
        else
        begin
          shblk_3.Top := (int_atastiang - int_tinggiblk - int_jarak);
          Timer2.Enabled := true;
          Timer1.Enabled := False;
        end;
      end
      else if Copy(str_IsiB, 1, 2) = '3B' then
      begin
        if shblk_3b.Top > (int_atastiang - int_tinggiblk - int_jarak) then
          shblk_3b.Top := shblk_3b.Top - 10
        else
        begin
          shblk_3b.Top := (int_atastiang - int_tinggiblk - int_jarak);
          Timer2.Enabled := true;
          Timer1.Enabled := False;
        end;
      end;
    end;
end;

procedure TForm2.Timer2Timer(Sender: TObject);
begin
  if str_pindahke = 'A' then
    int_tiang := shtiang_A.Left + (shtiang_A.Width div 2)
  else if str_pindahke = 'B' then
    int_tiang := shtiang_B.Left + (shtiang_B.Width div 2)
  else if str_pindahke = 'C' then
    int_tiang := shtiang_C.Left + (shtiang_C.Width div 2);

  if str_tiang = 'A' then
  begin
    if Copy(str_IsiA, 1, 2) = '1A' then
    begin
      shblk_1.Left := shblk_1.Left + 10;
      if (shblk_1.Left + (shblk_1.Width div 2)) > int_tiang then
      begin
        shblk_1.Left := int_tiang - (shblk_1.Width div 2);
        Timer3.Enabled := true;
        Timer2.Enabled := False;
      end;
    end

    else if Copy(str_IsiA, 1, 2) = '1B' then
    begin
      shblk_1b.Left := shblk_1b.Left + 10;
      if (shblk_1b.Left + (shblk_1b.Width div 2)) > int_tiang then
      begin
        shblk_1b.Left := int_tiang - (shblk_1b.Width div 2);
        Timer3.Enabled := true;
        Timer2.Enabled := False;
      end;
    end

    else if Copy(str_IsiA, 1, 2) = '2A' then
    begin
      shblk_2.Left := shblk_2.Left + 10;
      if (shblk_2.Left + (shblk_2.Width div 2)) > int_tiang then
      begin
        shblk_2.Left := int_tiang - (shblk_2.Width div 2);
        Timer3.Enabled := true;
        Timer2.Enabled := False;
      end;
    end

    else if Copy(str_IsiA, 1, 2) = '2B' then
    begin
      shblk_2b.Left := shblk_2b.Left + 10;
      if (shblk_2b.Left + (shblk_2b.Width div 2)) > int_tiang then
      begin
        shblk_2b.Left := int_tiang - (shblk_2b.Width div 2);
        Timer3.Enabled := true;
        Timer2.Enabled := False;
      end;
    end

    else if Copy(str_IsiA, 1, 2) = '3A' then
    begin
      shblk_3.Left := shblk_3.Left + 10;
      if (shblk_3.Left + (shblk_3.Width div 2)) > int_tiang then
      begin
        shblk_3.Left := int_tiang - (shblk_3.Width div 2);
        Timer3.Enabled := true;
        Timer2.Enabled := False;
      end;
    end

    else if Copy(str_IsiA, 1, 2) = '3B' then
    begin
      shblk_3b.Left := shblk_3b.Left + 10;
      if (shblk_3b.Left + (shblk_3b.Width div 2)) > int_tiang then
      begin
        shblk_3b.Left := int_tiang - (shblk_3b.Width div 2);
        Timer3.Enabled := true;
        Timer2.Enabled := False;
      end;
    end;

  end
  else if str_tiang = 'C' then
  begin
    if Copy(str_IsiC, 1, 2) = '1A' then
    begin
      shblk_1.Left := shblk_1.Left - 10;
      if (shblk_1.Left + (shblk_1.Width div 2)) < int_tiang then
      begin
        shblk_1.Left := int_tiang - (shblk_1.Width div 2);
        Timer3.Enabled := true;
        Timer2.Enabled := False;
      end;
    end
    else if Copy(str_IsiC, 1, 2) = '1B' then
    begin
      shblk_1b.Left := shblk_1b.Left - 10;
      if (shblk_1b.Left + (shblk_1b.Width div 2)) < int_tiang then
      begin
        shblk_1b.Left := int_tiang - (shblk_1b.Width div 2);
        Timer3.Enabled := true;
        Timer2.Enabled := False;
      end;
    end

    else if Copy(str_IsiC, 1, 2) = '2A' then
    begin
      shblk_2.Left := shblk_2.Left - 10;
      if (shblk_2.Left + (shblk_2.Width div 2)) < int_tiang then
      begin
        shblk_2.Left := int_tiang - (shblk_2.Width div 2);
        Timer3.Enabled := true;
        Timer2.Enabled := False;
      end;
    end
    else if Copy(str_IsiC, 1, 2) = '2B' then
    begin
      shblk_2b.Left := shblk_2b.Left - 10;
      if (shblk_2b.Left + (shblk_2b.Width div 2)) < int_tiang then
      begin
        shblk_2b.Left := int_tiang - (shblk_2b.Width div 2);
        Timer3.Enabled := true;
        Timer2.Enabled := False;
      end;
    end

    else if Copy(str_IsiC, 1, 2) = '3A' then
    begin
      shblk_3.Left := shblk_3.Left - 10;
      if (shblk_3.Left + (shblk_3.Width div 2)) < int_tiang then
      begin
        shblk_3.Left := int_tiang - (shblk_3.Width div 2);
        Timer3.Enabled := true;
        Timer2.Enabled := False;
      end;
    end
    else if Copy(str_IsiC, 1, 2) = '3B' then
    begin
      shblk_3b.Left := shblk_3b.Left - 10;
      if (shblk_3b.Left + (shblk_3b.Width div 2)) < int_tiang then
      begin
        shblk_3b.Left := int_tiang - (shblk_3b.Width div 2);
        Timer3.Enabled := true;
        Timer2.Enabled := False;
      end;
    end;

  end
  else if str_tiang = 'B' then
    if str_pindahke = 'C' then
    begin
      if Copy(str_IsiB, 1, 2) = '1A' then
      begin
        shblk_1.Left := shblk_1.Left + 10;
        if (shblk_1.Left + (shblk_1.Width div 2)) > int_tiang then
        begin
          shblk_1.Left := int_tiang - (shblk_1.Width div 2);
          Timer3.Enabled := true;
          Timer2.Enabled := False;
        end;
      end
      else if Copy(str_IsiB, 1, 2) = '1B' then
      begin
        shblk_1b.Left := shblk_1b.Left + 10;
        if (shblk_1b.Left + (shblk_1b.Width div 2)) > int_tiang then
        begin
          shblk_1b.Left := int_tiang - (shblk_1b.Width div 2);
          Timer3.Enabled := true;
          Timer2.Enabled := False;
        end;
      end
      else if Copy(str_IsiB, 1, 2) = '2A' then
      begin
        shblk_2.Left := shblk_2.Left + 10;
        if (shblk_2.Left + (shblk_2.Width div 2)) > int_tiang then
        begin
          shblk_2.Left := int_tiang - (shblk_2.Width div 2);
          Timer3.Enabled := true;
          Timer2.Enabled := False;
        end;
      end

      else if Copy(str_IsiB, 1, 2) = '2B' then
      begin
        shblk_2b.Left := shblk_2b.Left + 10;
        if (shblk_2b.Left + (shblk_2b.Width div 2)) > int_tiang then
        begin
          shblk_2b.Left := int_tiang - (shblk_2b.Width div 2);
          Timer3.Enabled := true;
          Timer2.Enabled := False;
        end;
      end

      else if Copy(str_IsiB, 1, 2) = '3A' then
      begin
        shblk_3.Left := shblk_3.Left + 10;
        if (shblk_3.Left + (shblk_3.Width div 2)) > int_tiang then
        begin
          shblk_3.Left := int_tiang - (shblk_3.Width div 2);
          Timer3.Enabled := true;
          Timer2.Enabled := False;
        end;
      end
      else if Copy(str_IsiB, 1, 2) = '3B' then
      begin
        shblk_3b.Left := shblk_3b.Left + 10;
        if (shblk_3b.Left + (shblk_3b.Width div 2)) > int_tiang then
        begin
          shblk_3b.Left := int_tiang - (shblk_3b.Width div 2);
          Timer3.Enabled := true;
          Timer2.Enabled := False;
        end;
      end;
    end

    else if str_pindahke = 'A' then
    begin
      if Copy(str_IsiB, 1, 2) = '1A' then
      begin
        shblk_1.Left := shblk_1.Left - 10;
        if (shblk_1.Left + (shblk_1.Width div 2)) < int_tiang then
        begin
          shblk_1.Left := int_tiang - (shblk_1.Width div 2);
          Timer3.Enabled := true;
          Timer2.Enabled := False;
        end;
      end
      else if Copy(str_IsiB, 1, 2) = '1B' then
      begin
        shblk_1b.Left := shblk_1b.Left - 10;
        if (shblk_1b.Left + (shblk_1b.Width div 2)) < int_tiang then
        begin
          shblk_1b.Left := int_tiang - (shblk_1b.Width div 2);
          Timer3.Enabled := true;
          Timer2.Enabled := False;
        end;
      end

      else if Copy(str_IsiB, 1, 2) = '2A' then
      begin
        shblk_2.Left := shblk_2.Left - 10;
        if (shblk_2.Left + (shblk_2.Width div 2)) < int_tiang then
        begin
          shblk_2.Left := int_tiang - (shblk_2.Width div 2);
          Timer3.Enabled := true;
          Timer2.Enabled := False;
        end;
      end

      else if Copy(str_IsiB, 1, 2) = '2B' then
      begin
        shblk_2b.Left := shblk_2b.Left - 10;
        if (shblk_2b.Left + (shblk_2b.Width div 2)) < int_tiang then
        begin
          shblk_2b.Left := int_tiang - (shblk_2b.Width div 2);
          Timer3.Enabled := true;
          Timer2.Enabled := False;
        end;
      end

      else if Copy(str_IsiB, 1, 2) = '3A' then
      begin
        shblk_3.Left := shblk_3.Left - 10;
        if (shblk_3.Left + (shblk_3.Width div 2)) < int_tiang then
        begin
          shblk_3.Left := int_tiang - (shblk_3.Width div 2);
          Timer3.Enabled := true;
          Timer2.Enabled := False;
        end;
      end
      else if Copy(str_IsiB, 1, 2) = '3B' then
      begin
        shblk_3b.Left := shblk_3b.Left - 10;
        if (shblk_3b.Left + (shblk_3b.Width div 2)) < int_tiang then
        begin
          shblk_3b.Left := int_tiang - (shblk_3b.Width div 2);
          Timer3.Enabled := true;
          Timer2.Enabled := False;
        end;
      end;
    end;
end;

procedure TForm2.Timer3Timer(Sender: TObject);
var
  int_posisi: integer;
begin
  if str_tiang = 'A' then // posisi A
  begin
    if str_pindahke = 'B' then // jika dipindah keposisi B
    begin
      if Length(str_IsiB) = 0 then
        int_posisi := int_terbawah
      else if Length(str_IsiB) = 2 then
        int_posisi := int_tengah1
      else if Length(str_IsiB) = 4 then
        int_posisi := int_tengah2
      else if Length(str_IsiB) = 6 then
        int_posisi := int_tengah3
      else if Length(str_IsiB) = 8 then
        int_posisi := int_tengah4
      else if Length(str_IsiB) = 10 then
        int_posisi := int_teratas;
    end
    else if (str_pindahke = 'C') then
    begin
      if Length(str_IsiC) = 0 then
        int_posisi := int_terbawah
      else if Length(str_IsiC) = 2 then
        int_posisi := int_tengah1
      else if Length(str_IsiC) = 4 then
        int_posisi := int_tengah2
      else if Length(str_IsiC) = 6 then
        int_posisi := int_tengah3
      else if Length(str_IsiC) = 8 then
        int_posisi := int_tengah4
      else if Length(str_IsiC) = 10 then
        int_posisi := int_teratas;
    end;

    if Copy(str_IsiA, 1, 2) = '1A' then // jika isi A balok paling kecil teratas
    begin
      shblk_1.Top := shblk_1.Top + 10;
      if (shblk_1.Top + int_tinggiblk + int_jarak) > int_posisi then
      begin
        shblk_1.Top := int_posisi - int_tinggiblk - int_jarak;
        str_IsiA := StringReplace(str_IsiA, '1A', '', [rfReplaceAll]);
        if str_pindahke = 'B' then
          str_IsiB := '1A' + str_IsiB;
        if str_pindahke = 'C' then
          str_IsiC := '1A' + str_IsiC;
        str_tiang := 'PILIHTIANG';
        sp_A.Enabled := true;
        sp_B.Enabled := true;
        sp_C.Enabled := true;
        Timer3.Enabled := False;
      end;
    end

    else if Copy(str_IsiA, 1, 2) = '1B' then // jika isi A balok paling kecil teratas
    begin
      shblk_1b.Top := shblk_1b.Top + 10;
      if (shblk_1b.Top + int_tinggiblk + int_jarak) > int_posisi then
      begin
        shblk_1b.Top := int_posisi - int_tinggiblk - int_jarak;
        str_IsiA := StringReplace(str_IsiA, '1B', '', [rfReplaceAll]);
        if str_pindahke = 'B' then
          str_IsiB := '1B' + str_IsiB;
        if str_pindahke = 'C' then
          str_IsiC := '1B' + str_IsiC;
        str_tiang := 'PILIHTIANG';
        sp_A.Enabled := true;
        sp_B.Enabled := true;
        sp_C.Enabled := true;
        Timer3.Enabled := False;
      end;
    end

    else if Copy(str_IsiA, 1, 2) = '2A' then
    begin
      shblk_2.Top := shblk_2.Top + 10;
      if (shblk_2.Top + int_tinggiblk + int_jarak) > int_posisi then
      begin
        shblk_2.Top := int_posisi - int_tinggiblk - int_jarak;
        str_IsiA := StringReplace(str_IsiA, '2A', '', [rfReplaceAll]);
        if str_pindahke = 'B' then
          str_IsiB := '2A' + str_IsiB;
        if str_pindahke = 'C' then
          str_IsiC := '2A' + str_IsiC;
        str_tiang := 'PILIHTIANG';
        sp_A.Enabled := true;
        sp_B.Enabled := true;
        sp_C.Enabled := true;
        Timer3.Enabled := False;
        // cek
        if str_pindahke = 'B' then
        begin
          if Length(str_IsiB) > 2 then
            if (strtoint(Copy(str_IsiB, 1, 1))) >
              (strtoint(Copy(str_IsiB, 3, 1))) then
            begin
              ShowMessage(
                'Salah !!! Yang kecil diatas. Saya Kembalikan lagi ke asal deh '
                );
              sp_BClick(Self);
              sp_AClick(Self);
            end;
        end
        else if str_pindahke = 'C' then
        begin
          if Length(str_IsiC) > 2 then
            if (strtoint(Copy(str_IsiC, 1, 1))) >
              (strtoint(Copy(str_IsiC, 3, 1))) then
            begin
              ShowMessage(
                'Salah !!! Yang kecil diatas. Saya Kembalikan lagi ke asal deh '
                );
              sp_CClick(Self);
              sp_AClick(Self);
            end;
        end;
        // end of cek
      end;
    end

    else if Copy(str_IsiA, 1, 2) = '2B' then
    begin
      shblk_2b.Top := shblk_2b.Top + 10;
      if (shblk_2b.Top + int_tinggiblk + int_jarak) > int_posisi then
      begin
        shblk_2b.Top := int_posisi - int_tinggiblk - int_jarak;
        str_IsiA := StringReplace(str_IsiA, '2B', '', [rfReplaceAll]);
        if str_pindahke = 'B' then
          str_IsiB := '2B' + str_IsiB;
        if str_pindahke = 'C' then
          str_IsiC := '2B' + str_IsiC;
        str_tiang := 'PILIHTIANG';
        sp_A.Enabled := true;
        sp_B.Enabled := true;
        sp_C.Enabled := true;
        Timer3.Enabled := False;
        // cek
        if str_pindahke = 'B' then
        begin
          if Length(str_IsiB) > 2 then
            if (strtoint(Copy(str_IsiB, 1, 1))) >
              (strtoint(Copy(str_IsiB, 3, 1))) then
            begin
              ShowMessage(
                'Salah !!! Yang kecil diatas. Saya Kembalikan lagi ke asal deh '
                );
              sp_BClick(Self);
              sp_AClick(Self);
            end;
        end
        else if str_pindahke = 'C' then
        begin
          if Length(str_IsiC) > 2 then
            if (strtoint(Copy(str_IsiC, 1, 1))) >
              (strtoint(Copy(str_IsiC, 3, 1))) then
            begin
              ShowMessage(
                'Salah !!! Yang kecil diatas. Saya Kembalikan lagi ke asal deh '
                );
              sp_CClick(Self);
              sp_AClick(Self);
            end;
        end;
        // end of cek
      end;
    end

    else if Copy(str_IsiA, 1, 2) = '3A' then
    begin
      shblk_3.Top := shblk_3.Top + 10;
      if (shblk_3.Top + int_tinggiblk + int_jarak) > int_posisi then
      begin
        shblk_3.Top := int_posisi - int_tinggiblk - int_jarak;
        str_IsiA := StringReplace(str_IsiA, '3A', '', [rfReplaceAll]);
        if str_pindahke = 'B' then
          str_IsiB := '3A' + str_IsiB;
        if str_pindahke = 'C' then
          str_IsiC := '3A' + str_IsiC;
        str_tiang := 'PILIHTIANG';
        sp_A.Enabled := true;
        sp_B.Enabled := true;
        sp_C.Enabled := true;
        Timer3.Enabled := False;
        // cek
        if str_pindahke = 'B' then
        begin
          if Length(str_IsiB) > 2 then
            if (strtoint(Copy(str_IsiB, 1, 1))) >
              (strtoint(Copy(str_IsiB, 3, 1))) then
            begin
              ShowMessage(
                'Salah !!! Yang kecil diatas. Saya Kembalikan lagi ke asal deh '
                );
              sp_BClick(Self);
              sp_AClick(Self);
            end;
        end
        else if str_pindahke = 'C' then
        begin
          if Length(str_IsiC) > 2 then
            if (strtoint(Copy(str_IsiC, 1, 1))) >
              (strtoint(Copy(str_IsiC, 3, 1))) then
            begin
              ShowMessage(
                'Salah !!! Yang kecil diatas. Saya Kembalikan lagi ke asal deh '
                );
              sp_CClick(Self);
              sp_AClick(Self);
            end;
        end;
        // end of cek
      end;
    end
    else if Copy(str_IsiA, 1, 2) = '3B' then
    begin
      shblk_3b.Top := shblk_3b.Top + 10;
      if (shblk_3b.Top + int_tinggiblk + int_jarak) > int_posisi then
      begin
        shblk_3b.Top := int_posisi - int_tinggiblk - int_jarak;
        str_IsiA := StringReplace(str_IsiA, '3B', '', [rfReplaceAll]);
        if str_pindahke = 'B' then
          str_IsiB := '3B' + str_IsiB;
        if str_pindahke = 'C' then
          str_IsiC := '3B' + str_IsiC;
        str_tiang := 'PILIHTIANG';
        sp_A.Enabled := true;
        sp_B.Enabled := true;
        sp_C.Enabled := true;
        Timer3.Enabled := False;
        // cek
        if str_pindahke = 'B' then
        begin
          if Length(str_IsiB) > 2 then
            if (strtoint(Copy(str_IsiB, 1, 1))) >
              (strtoint(Copy(str_IsiB, 3, 1))) then
            begin
              ShowMessage(
                'Salah !!! Yang kecil diatas. Saya Kembalikan lagi ke asal deh '
                );
              sp_BClick(Self);
              sp_AClick(Self);
            end;
        end
        else if str_pindahke = 'C' then
        begin
          if Length(str_IsiC) > 2 then
            if (strtoint(Copy(str_IsiC, 1, 1))) >
              (strtoint(Copy(str_IsiC, 3, 1))) then
            begin
              ShowMessage(
                'Salah !!! Yang kecil diatas. Saya Kembalikan lagi ke asal deh '
                );
              sp_CClick(Self);
              sp_AClick(Self);
            end;
        end;
        // end of cek
      end;
    end;
  end // end of poasisi A

  else if str_tiang = 'B' then // posisi B
  begin
    if str_pindahke = 'A' then // jika di pindah ke A
    begin
      if Length(str_IsiA) = 0 then
        int_posisi := int_terbawah
      else if Length(str_IsiA) = 2 then
        int_posisi := int_tengah1
      else if Length(str_IsiA) = 4 then
        int_posisi := int_tengah2
      else if Length(str_IsiA) = 6 then
        int_posisi := int_tengah3
      else if Length(str_IsiA) = 8 then
        int_posisi := int_tengah4
      else if Length(str_IsiA) = 10 then
        int_posisi := int_teratas;
    end
    else if (str_pindahke = 'C') then // jika dipindah ke C
    begin
      if Length(str_IsiC) = 0 then
        int_posisi := int_terbawah
      else if Length(str_IsiC) = 2 then
        int_posisi := int_tengah1
      else if Length(str_IsiC) = 4 then
        int_posisi := int_tengah2
      else if Length(str_IsiC) = 6 then
        int_posisi := int_tengah3
      else if Length(str_IsiC) = 8 then
        int_posisi := int_tengah4
      else if Length(str_IsiC) = 10 then
        int_posisi := int_teratas;
    end;

    if Copy(str_IsiB, 1, 2) = '1A' then // balok terkecil teratas
    begin
      shblk_1.Top := shblk_1.Top + 10;
      if (shblk_1.Top + int_tinggiblk + int_jarak) > int_posisi then
      begin
        shblk_1.Top := int_posisi - int_tinggiblk - int_jarak;
        str_IsiB := StringReplace(str_IsiB, '1A', '', [rfReplaceAll]);
        if str_pindahke = 'A' then
          str_IsiA := '1A' + str_IsiA;
        if str_pindahke = 'C' then
          str_IsiC := '1A' + str_IsiC;
        str_tiang := 'PILIHTIANG';
        sp_A.Enabled := true;
        sp_B.Enabled := true;
        sp_C.Enabled := true;
        Timer3.Enabled := False;
      end;
    end

    else if Copy(str_IsiB, 1, 2) = '1B' then // balok terkecil teratas
    begin
      shblk_1b.Top := shblk_1b.Top + 10;
      if (shblk_1b.Top + int_tinggiblk + int_jarak) > int_posisi then
      begin
        shblk_1b.Top := int_posisi - int_tinggiblk - int_jarak;
        str_IsiB := StringReplace(str_IsiB, '1B', '', [rfReplaceAll]);
        if str_pindahke = 'A' then
          str_IsiA := '1B' + str_IsiA;
        if str_pindahke = 'C' then
          str_IsiC := '1B' + str_IsiC;
        str_tiang := 'PILIHTIANG';
        sp_A.Enabled := true;
        sp_B.Enabled := true;
        sp_C.Enabled := true;
        Timer3.Enabled := False;
      end;
    end

    else if Copy(str_IsiB, 1, 2) = '2A' then // balok ukuran sedang teratas
    begin
      shblk_2.Top := shblk_2.Top + 10;
      if (shblk_2.Top + int_tinggiblk + int_jarak) > int_posisi then
      begin
        shblk_2.Top := int_posisi - int_tinggiblk - int_jarak;
        str_IsiB := StringReplace(str_IsiB, '2A', '', [rfReplaceAll]);
        if str_pindahke = 'A' then
          str_IsiA := '2A' + str_IsiA;
        if str_pindahke = 'C' then
          str_IsiC := '2A' + str_IsiC;
        str_tiang := 'PILIHTIANG';
        sp_A.Enabled := true;
        sp_B.Enabled := true;
        sp_C.Enabled := true;
        Timer3.Enabled := False;
        // cek
        if str_pindahke = 'A' then
        begin
          if Length(str_IsiA) > 2 then
            if (strtoint(Copy(str_IsiA, 1, 1))) >
              (strtoint(Copy(str_IsiA, 3, 1))) then
            begin
              ShowMessage(
                'Salah !!! Yang kecil diatas. Saya Kembalikan lagi ke asal deh '
                );
              sp_AClick(Self);
              sp_BClick(Self);
            end;
        end
        else if str_pindahke = 'C' then
        begin
          if Length(str_IsiC) > 2 then
            if (strtoint(Copy(str_IsiC, 1, 1))) >
              (strtoint(Copy(str_IsiC, 3, 1))) then
            begin
              ShowMessage(
                'Salah !!! Yang kecil diatas. Saya Kembalikan lagi ke asal deh '
                );
              sp_CClick(Self);
              sp_BClick(Self);
            end;
        end;
        // end of cek

      end;
    end

    else if Copy(str_IsiB, 1, 2) = '2B' then // balok ukuran sedang teratas
    begin
      shblk_2b.Top := shblk_2b.Top + 10;
      if (shblk_2b.Top + int_tinggiblk + int_jarak) > int_posisi then
      begin
        shblk_2b.Top := int_posisi - int_tinggiblk - int_jarak;
        str_IsiB := StringReplace(str_IsiB, '2B', '', [rfReplaceAll]);
        if str_pindahke = 'A' then
          str_IsiA := '2B' + str_IsiA;
        if str_pindahke = 'C' then
          str_IsiC := '2B' + str_IsiC;
        str_tiang := 'PILIHTIANG';
        sp_A.Enabled := true;
        sp_B.Enabled := true;
        sp_C.Enabled := true;
        Timer3.Enabled := False;
        // cek
        if str_pindahke = 'A' then
        begin
          if Length(str_IsiA) > 2 then
            if (strtoint(Copy(str_IsiA, 1, 1))) >
              (strtoint(Copy(str_IsiA, 3, 1))) then
            begin
              ShowMessage(
                'Salah !!! Yang kecil diatas. Saya Kembalikan lagi ke asal deh '
                );
              sp_AClick(Self);
              sp_BClick(Self);
            end;
        end
        else if str_pindahke = 'C' then
        begin
          if Length(str_IsiC) > 2 then
            if (strtoint(Copy(str_IsiC, 1, 1))) >
              (strtoint(Copy(str_IsiC, 3, 1))) then
            begin
              ShowMessage(
                'Salah !!! Yang kecil diatas. Saya Kembalikan lagi ke asal deh '
                );
              sp_CClick(Self);
              sp_BClick(Self);
            end;
        end;
        // end of cek
      end;
    end

    else if Copy(str_IsiB, 1, 2) = '3A' then // balok terbesar ukuran teratas
    begin
      shblk_3.Top := shblk_3.Top + 10;
      if (shblk_3.Top + int_tinggiblk + int_jarak) > int_posisi then
      begin
        shblk_3.Top := int_posisi - int_tinggiblk - int_jarak;
        str_IsiB := StringReplace(str_IsiB, '3A', '', [rfReplaceAll]);
        if str_pindahke = 'A' then
          str_IsiA := '3A' + str_IsiA;
        if str_pindahke = 'C' then
          str_IsiC := '3A' + str_IsiC;
        str_tiang := 'PILIHTIANG';
        sp_A.Enabled := true;
        sp_B.Enabled := true;
        sp_C.Enabled := true;
        Timer3.Enabled := False;
        // cek
        if str_pindahke = 'A' then
        begin
          if Length(str_IsiA) > 2 then
            if (strtoint(Copy(str_IsiA, 1, 1))) >
              (strtoint(Copy(str_IsiA, 3, 1))) then
            begin
              ShowMessage(
                'Salah !!! Yang kecil diatas. Saya Kembalikan lagi ke asal deh '
                );
              sp_AClick(Self);
              sp_BClick(Self);
            end;
        end
        else if str_pindahke = 'C' then

        begin
          if Length(str_IsiC) > 2 then
            if (strtoint(Copy(str_IsiC, 1, 1))) >
              (strtoint(Copy(str_IsiC, 3, 1))) then
            begin
              ShowMessage(
                'Salah !!! Yang kecil diatas. Saya Kembalikan lagi ke asal deh '
                );
              sp_CClick(Self);
              sp_BClick(Self);
            end;
        end;
        // end of cek
      end;
    end

    else if Copy(str_IsiB, 1, 2) = '3B' then // balok terbesar ukuran teratas
    begin
      shblk_3b.Top := shblk_3b.Top + 10;
      if (shblk_3b.Top + int_tinggiblk + int_jarak) > int_posisi then
      begin
        shblk_3b.Top := int_posisi - int_tinggiblk - int_jarak;
        str_IsiB := StringReplace(str_IsiB, '3B', '', [rfReplaceAll]);
        if str_pindahke = 'A' then
          str_IsiA := '3B' + str_IsiA;
        if str_pindahke = 'C' then
          str_IsiC := '3B' + str_IsiC;
        str_tiang := 'PILIHTIANG';
        sp_A.Enabled := true;
        sp_B.Enabled := true;
        sp_C.Enabled := true;
        Timer3.Enabled := False;
        // cek
        if str_pindahke = 'A' then
        begin
          if Length(str_IsiA) > 2 then
            if (strtoint(Copy(str_IsiA, 1, 1))) >
              (strtoint(Copy(str_IsiA, 3, 1))) then
            begin
              ShowMessage(
                'Salah !!! Yang kecil diatas. Saya Kembalikan lagi ke asal deh '
                );
              sp_AClick(Self);
              sp_BClick(Self);
            end;
        end
        else if str_pindahke = 'C' then
        begin
          if Length(str_IsiC) > 2 then
            if (strtoint(Copy(str_IsiC, 1, 1))) >
              (strtoint(Copy(str_IsiC, 3, 1))) then
            begin
              ShowMessage(
                'Salah !!! Yang kecil diatas. Saya Kembalikan lagi ke asal deh '
                );
              sp_CClick(Self);
              sp_BClick(Self);
            end;
        end;
        // end of cek
      end;
    end;

  end // end of posisi B
  else if str_tiang = 'C' then // posisi C
  begin
    if str_pindahke = 'A' then // jika dipindah ke A
    begin
      if Length(str_IsiA) = 0 then
        int_posisi := int_terbawah
      else if Length(str_IsiA) = 2 then
        int_posisi := int_tengah1
      else if Length(str_IsiA) = 4 then
        int_posisi := int_tengah2
      else if Length(str_IsiA) = 6 then
        int_posisi := int_tengah3
      else if Length(str_IsiA) = 8 then
        int_posisi := int_tengah4
      else if Length(str_IsiA) = 10 then
        int_posisi := int_teratas;
    end
    else if str_pindahke = 'B' then // jika dipindah ke B
    begin
      if Length(str_IsiB) = 0 then
        int_posisi := int_terbawah
      else if Length(str_IsiB) = 2 then
        int_posisi := int_tengah1
      else if Length(str_IsiB) = 4 then
        int_posisi := int_tengah2
      else if Length(str_IsiB) = 6 then
        int_posisi := int_tengah3
      else if Length(str_IsiB) = 8 then
        int_posisi := int_tengah4
      else if Length(str_IsiB) = 10 then
        int_posisi := int_teratas;
    end;

    if Copy(str_IsiC, 1, 2) = '1A' then // balok terkecil
    begin
      shblk_1.Top := shblk_1.Top + 10;
      if (shblk_1.Top + int_tinggiblk + int_jarak) > int_posisi then
      begin
        shblk_1.Top := int_posisi - int_tinggiblk - int_jarak;
        str_IsiC := StringReplace(str_IsiC, '1A', '', [rfReplaceAll]);
        if str_pindahke = 'B' then
          str_IsiB := '1A' + str_IsiB;
        if str_pindahke = 'A' then
          str_IsiA := '1A' + str_IsiA;
        str_tiang := 'PILIHTIANG';
        sp_A.Enabled := true;
        sp_B.Enabled := true;
        sp_C.Enabled := true;
        Timer3.Enabled := False;
      end;
    end
    else if Copy(str_IsiC, 1, 2) = '1B' then // balok terkecil
    begin
      shblk_1b.Top := shblk_1b.Top + 10;
      if (shblk_1b.Top + int_tinggiblk + int_jarak) > int_posisi then
      begin
        shblk_1b.Top := int_posisi - int_tinggiblk - int_jarak;
        str_IsiC := StringReplace(str_IsiC, '1B', '', [rfReplaceAll]);
        if str_pindahke = 'B' then
          str_IsiB := '1B' + str_IsiB;
        if str_pindahke = 'A' then
          str_IsiA := '1B' + str_IsiA;
        str_tiang := 'PILIHTIANG';
        sp_A.Enabled := true;
        sp_B.Enabled := true;
        sp_C.Enabled := true;
        Timer3.Enabled := False;
      end;
    end

    else if Copy(str_IsiC, 1, 2) = '2A' then
    begin
      shblk_2.Top := shblk_2.Top + 10;
      if (shblk_2.Top + int_tinggiblk + int_jarak) > int_posisi then
      begin
        shblk_2.Top := int_posisi - int_tinggiblk - int_jarak;
        str_IsiC := StringReplace(str_IsiC, '2A', '', [rfReplaceAll]);
        if str_pindahke = 'B' then
          str_IsiB := '2A' + str_IsiB;
        if str_pindahke = 'A' then
          str_IsiA := '2A' + str_IsiA;
        str_tiang := 'PILIHTIANG';
        sp_A.Enabled := true;
        sp_B.Enabled := true;
        sp_C.Enabled := true;
        Timer3.Enabled := False;
        // cek
        if str_pindahke = 'A' then
        begin
          if Length(str_IsiA) > 2 then
            if (strtoint(Copy(str_IsiA, 1, 1))) >
              (strtoint(Copy(str_IsiA, 3, 1))) then
            begin
              ShowMessage(
                'Salah !!! Yang kecil diatas. Saya Kembalikan lagi ke asal deh '
                );
              sp_AClick(Self);
              sp_CClick(Self);
            end;
        end
        else if str_pindahke = 'B' then
        begin
          if Length(str_IsiB) > 2 then
            if (strtoint(Copy(str_IsiB, 1, 1))) >
              (strtoint(Copy(str_IsiB, 3, 1))) then
            begin
              ShowMessage(
                'Salah !!! Yang kecil diatas. Saya Kembalikan lagi ke asal deh '
                );
              sp_BClick(Self);
              sp_CClick(Self);
            end;
        end;
        // end of cek
      end;
    end

    else if Copy(str_IsiC, 1, 2) = '2B' then
    begin
      shblk_2b.Top := shblk_2b.Top + 10;
      if (shblk_2b.Top + int_tinggiblk + int_jarak) > int_posisi then
      begin
        shblk_2b.Top := int_posisi - int_tinggiblk - int_jarak;
        str_IsiC := StringReplace(str_IsiC, '2B', '', [rfReplaceAll]);
        if str_pindahke = 'B' then
          str_IsiB := '2B' + str_IsiB;
        if str_pindahke = 'A' then
          str_IsiA := '2B' + str_IsiA;
        str_tiang := 'PILIHTIANG';
        sp_A.Enabled := true;
        sp_B.Enabled := true;
        sp_C.Enabled := true;
        Timer3.Enabled := False;
        // cek
        if str_pindahke = 'A' then
        begin
          if Length(str_IsiA) > 2 then
            if (strtoint(Copy(str_IsiA, 1, 1))) >
              (strtoint(Copy(str_IsiA, 3, 1))) then
            begin
              ShowMessage(
                'Salah !!! Yang kecil diatas. Saya Kembalikan lagi ke asal deh '
                );
              sp_AClick(Self);
              sp_CClick(Self);
            end;
        end
        else if str_pindahke = 'B' then
        begin
          if Length(str_IsiB) > 2 then
            if (strtoint(Copy(str_IsiB, 1, 1))) >
              (strtoint(Copy(str_IsiB, 3, 1))) then
            begin
              ShowMessage(
                'Salah !!! Yang kecil diatas. Saya Kembalikan lagi ke asal deh '
                );
              sp_BClick(Self);
              sp_CClick(Self);
            end;
        end;
        // end of cek
      end;
    end

    else if Copy(str_IsiC, 1, 2) = '3A' then
    begin
      shblk_3.Top := shblk_3.Top + 10;
      if (shblk_3.Top + int_tinggiblk + int_jarak) > int_posisi then
      begin
        shblk_3.Top := int_posisi - int_tinggiblk - int_jarak;
        str_IsiC := StringReplace(str_IsiC, '3A', '', [rfReplaceAll]);
        if str_pindahke = 'B' then
          str_IsiB := '3A' + str_IsiB;
        if str_pindahke = 'A' then
          str_IsiA := '3A' + str_IsiA;
        str_tiang := 'PILIHTIANG';
        sp_A.Enabled := true;
        sp_B.Enabled := true;
        sp_C.Enabled := true;
        Timer3.Enabled := False;
        // cek
        if str_pindahke = 'A' then
        begin
          if Length(str_IsiA) > 2 then
            if (strtoint(Copy(str_IsiA, 1, 1))) >
              (strtoint(Copy(str_IsiA, 3, 1))) then
            begin
              ShowMessage(
                'Salah !!! Yang kecil diatas. Saya Kembalikan lagi ke asal deh '
                );
              sp_AClick(Self);
              sp_CClick(Self);
            end;
        end
        else if str_pindahke = 'B' then
        begin
          if Length(str_IsiB) > 2 then
            if (strtoint(Copy(str_IsiB, 1, 1))) >
              (strtoint(Copy(str_IsiB, 3, 1))) then
            begin
              ShowMessage(
                'Salah !!! Yang kecil diatas. Saya Kembalikan lagi ke asal deh '
                );
              sp_BClick(Self);
              sp_CClick(Self);
            end;
        end;
        // end of cek
      end;
    end

    else if Copy(str_IsiC, 1, 2) = '3B' then
    begin
      shblk_3b.Top := shblk_3b.Top + 10;
      if (shblk_3b.Top + int_tinggiblk + int_jarak) > int_posisi then
      begin
        shblk_3b.Top := int_posisi - int_tinggiblk - int_jarak;
        str_IsiC := StringReplace(str_IsiC, '3B', '', [rfReplaceAll]);
        if str_pindahke = 'B' then
          str_IsiB := '3B' + str_IsiB;
        if str_pindahke = 'A' then
          str_IsiA := '3B' + str_IsiA;
        str_tiang := 'PILIHTIANG';
        sp_A.Enabled := true;
        sp_B.Enabled := true;
        sp_C.Enabled := true;
        Timer3.Enabled := False;
        // cek
        if str_pindahke = 'A' then
        begin
          if Length(str_IsiA) > 2 then
            if (strtoint(Copy(str_IsiA, 1, 1))) >
              (strtoint(Copy(str_IsiA, 3, 1))) then
            begin
              ShowMessage(
                'Salah !!! Yang kecil diatas. Saya Kembalikan lagi ke asal deh '
                );
              sp_AClick(Self);
              sp_CClick(Self);
            end;
        end
        else if str_pindahke = 'B' then
        begin
          if Length(str_IsiB) > 2 then
            if (strtoint(Copy(str_IsiB, 1, 1))) >
              (strtoint(Copy(str_IsiB, 3, 1))) then
            begin
              ShowMessage(
                'Salah !!! Yang kecil diatas. Saya Kembalikan lagi ke asal deh '
                );
              sp_BClick(Self);
              sp_CClick(Self);
            end;
        end;
        // end of cek
      end;
    end;
  end; // end of C

  if (str_IsiC = '1A2A3A') and (str_IsiB = '1B2B3B') then
  begin
    Timer3.Enabled := False;
    ShowMessage('Bisa sih, Cuman Masih terbalik  >_< ');
  end;

  if (str_IsiB = '1A2A3A') and (str_IsiC = '1B2B3B') then
  begin
    Timer3.Enabled := False;
    ShowMessage('Hoooooore - hoooore Anda berhasil @_@ ');
    ShowMessage('Oke mulai lagi dari awal @_@ ');
    str_tiang := 'A';
    PosisiAwal;
  end;
  lbl_langkah.Caption := IntToStr(int_langkah) + ' langkah';
end;

end.
