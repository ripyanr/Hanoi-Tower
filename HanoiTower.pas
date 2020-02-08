unit HanoiTower;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, jpeg, Buttons, StrUtils;

type
  TForm2 = class(TForm)
    Timer1: TTimer;
    shblk_3: TShape;
    shblk_2: TShape;
    shblk_1: TShape;
    shtiang_A: TShape;
    shAlas: TShape;
    shtiang_B: TShape;
    shtiang_C: TShape;
    sp_A: TSpeedButton;
    sp_B: TSpeedButton;
    sp_C: TSpeedButton;
    Timer2: TTimer;
    Timer3: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure sp_AClick(Sender: TObject);
    procedure sp_BClick(Sender: TObject);
    procedure sp_CClick(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);

  private
    { Private declarations }
    procedure PosisiAwal();
    procedure PindahPosisi();

  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  str_tiang: string;
  str_pindahke: string;
  int_tiang: integer;
  int_terbawah: integer;
  int_tengah: integer;
  int_teratas: integer;
  int_jarak: integer;
  int_tinggiblk: integer;
  int_tinggitiang: integer;
  int_atastiang: integer;
  str_IsiA, str_IsiB, str_IsiC: string;

implementation

{$R *.dfm}

procedure TForm2.PindahPosisi();
begin
  if shblk_1.Tag = 1 then
  begin
    while shblk_1.Top > (int_atastiang - int_tinggiblk - int_jarak) do
    begin
      shblk_1.Top := shblk_1.Top - 1;
    end;
  end;

end;

procedure TForm2.PosisiAwal();
begin
  int_jarak := 5;
  int_tinggiblk := 64;
  int_tinggitiang := 240;
  int_atastiang := 152;
  str_IsiA := '123';
  str_IsiB := '';
  str_IsiC := '';

  shblk_1.Height := int_tinggiblk;
  shblk_2.Height := int_tinggiblk;
  shblk_3.Height := int_tinggiblk;

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

  int_terbawah := shtiang_A.Top + int_tinggitiang - int_jarak;
  int_tengah := int_terbawah - int_tinggiblk - int_jarak;
  int_teratas := int_tengah - int_tinggiblk - int_jarak;

  shblk_3.Top := int_terbawah - int_tinggiblk - int_jarak;
  shblk_3.Tag := 3; // posisi paling bawah
  shblk_2.Top := int_tengah - int_tinggiblk - int_jarak;
  shblk_2.Tag := 2; // posisisi tengah
  shblk_1.Top := int_teratas - int_tinggiblk - int_jarak;
  shblk_1.Tag := 1; // posisi paling atas
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  str_tiang := 'A';
  PosisiAwal;
end;

procedure TForm2.sp_AClick(Sender: TObject);
begin

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
    Timer1.Enabled := true;
  end;
end;

procedure TForm2.sp_BClick(Sender: TObject);
begin
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
    Timer1.Enabled := true;
  end;
end;

procedure TForm2.sp_CClick(Sender: TObject);
begin
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
    Timer1.Enabled := true;
  end;
end;

procedure TForm2.Timer1Timer(Sender: TObject);
begin

  if str_tiang = 'A' then
  begin
    if LeftStr(str_IsiA, 1) = '1' then
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
    else if LeftStr(str_IsiA, 1) = '2' then
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
    else if LeftStr(str_IsiA, 1) = '3' then
    begin

      if shblk_3.Top > (int_atastiang - int_tinggiblk - int_jarak) then
        shblk_3.Top := shblk_3.Top - 10
      else
      begin
        shblk_3.Top := (int_atastiang - int_tinggiblk - int_jarak);
        Timer2.Enabled := true;
        Timer1.Enabled := False;
      end;
    end;
  end
  else if str_tiang = 'C' then
  begin
    if LeftStr(str_IsiC, 1) = '1' then
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
    else if LeftStr(str_IsiC, 1) = '2' then
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
    else if LeftStr(str_IsiC, 1) = '3' then
    begin

      if shblk_3.Top > (int_atastiang - int_tinggiblk - int_jarak) then
        shblk_3.Top := shblk_3.Top - 10
      else
      begin
        shblk_3.Top := (int_atastiang - int_tinggiblk - int_jarak);
        Timer2.Enabled := true;
        Timer1.Enabled := False;
      end;
    end;
  end
  else if str_tiang = 'B' then
    if str_pindahke = 'A' then
    begin
      if LeftStr(str_IsiB, 1) = '1' then
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
      else if LeftStr(str_IsiB, 1) = '2' then
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
      else if LeftStr(str_IsiB, 1) = '3' then
      begin

        if shblk_3.Top > (int_atastiang - int_tinggiblk - int_jarak) then
          shblk_3.Top := shblk_3.Top - 10
        else
        begin
          shblk_3.Top := (int_atastiang - int_tinggiblk - int_jarak);
          Timer2.Enabled := true;
          Timer1.Enabled := False;
        end;
      end;
    end
    else if str_pindahke = 'C' then
    begin
      if LeftStr(str_IsiB, 1) = '1' then
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
      else if LeftStr(str_IsiB, 1) = '2' then
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
      else if LeftStr(str_IsiB, 1) = '3' then
      begin

        if shblk_3.Top > (int_atastiang - int_tinggiblk - int_jarak) then
          shblk_3.Top := shblk_3.Top - 10
        else
        begin
          shblk_3.Top := (int_atastiang - int_tinggiblk - int_jarak);
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
    if LeftStr(str_IsiA, 1) = '1' then
    begin
      shblk_1.Left := shblk_1.Left + 10;
      if (shblk_1.Left + (shblk_1.Width div 2)) > int_tiang then
      begin
        shblk_1.Left := int_tiang - (shblk_1.Width div 2);
        Timer3.Enabled := true;
        Timer2.Enabled := False;
      end;
    end
    else if LeftStr(str_IsiA, 1) = '2' then
    begin
      shblk_2.Left := shblk_2.Left + 10;
      if (shblk_2.Left + (shblk_2.Width div 2)) > int_tiang then
      begin
        shblk_2.Left := int_tiang - (shblk_2.Width div 2);
        Timer3.Enabled := true;
        Timer2.Enabled := False;
      end;
    end;
    if LeftStr(str_IsiA, 1) = '3' then
    begin
      shblk_3.Left := shblk_3.Left + 10;
      if (shblk_3.Left + (shblk_3.Width div 2)) > int_tiang then
      begin
        shblk_3.Left := int_tiang - (shblk_3.Width div 2);
        Timer3.Enabled := true;
        Timer2.Enabled := False;
      end;
    end;
  end
  else if str_tiang = 'C' then
  begin
    if LeftStr(str_IsiC, 1) = '1' then
    begin
      shblk_1.Left := shblk_1.Left - 10;
      if (shblk_1.Left + (shblk_1.Width div 2)) < int_tiang then
      begin
        shblk_1.Left := int_tiang - (shblk_1.Width div 2);
        Timer3.Enabled := true;
        Timer2.Enabled := False;
      end;
    end
    else if LeftStr(str_IsiC, 1) = '2' then
    begin
      shblk_2.Left := shblk_2.Left - 10;
      if (shblk_2.Left + (shblk_2.Width div 2)) < int_tiang then
      begin
        shblk_2.Left := int_tiang - (shblk_2.Width div 2);
        Timer3.Enabled := true;
        Timer2.Enabled := False;
      end;
    end;
    if LeftStr(str_IsiC, 1) = '3' then
    begin
      shblk_3.Left := shblk_3.Left - 10;
      if (shblk_3.Left + (shblk_3.Width div 2)) < int_tiang then
      begin
        shblk_3.Left := int_tiang - (shblk_3.Width div 2);
        Timer3.Enabled := true;
        Timer2.Enabled := False;
      end;
    end;
  end
  else if str_tiang = 'B' then
    if str_pindahke = 'C' then
    begin
      if LeftStr(str_IsiB, 1) = '1' then
      begin
        shblk_1.Left := shblk_1.Left + 10;
        if (shblk_1.Left + (shblk_1.Width div 2)) > int_tiang then
        begin
          shblk_1.Left := int_tiang - (shblk_1.Width div 2);
          Timer3.Enabled := true;
          Timer2.Enabled := False;
        end;
      end
      else if LeftStr(str_IsiB, 1) = '2' then
      begin
        shblk_2.Left := shblk_2.Left + 10;
        if (shblk_2.Left + (shblk_2.Width div 2)) > int_tiang then
        begin
          shblk_2.Left := int_tiang - (shblk_2.Width div 2);
          Timer3.Enabled := true;
          Timer2.Enabled := False;
        end;
      end
      else if LeftStr(str_IsiB, 1) = '3' then
      begin
        shblk_3.Left := shblk_3.Left + 10;
        if (shblk_3.Left + (shblk_3.Width div 2)) > int_tiang then
        begin
          shblk_3.Left := int_tiang - (shblk_3.Width div 2);
          Timer3.Enabled := true;
          Timer2.Enabled := False;
        end;
      end
    end
    else if str_pindahke = 'A' then
    begin
      if LeftStr(str_IsiB, 1) = '1' then
      begin
        shblk_1.Left := shblk_1.Left - 10;
        if (shblk_1.Left + (shblk_1.Width div 2)) < int_tiang then
        begin
          shblk_1.Left := int_tiang - (shblk_1.Width div 2);
          Timer3.Enabled := true;
          Timer2.Enabled := False;
        end;
      end
      else if LeftStr(str_IsiB, 1) = '2' then
      begin
        shblk_2.Left := shblk_2.Left - 10;
        if (shblk_2.Left + (shblk_2.Width div 2)) < int_tiang then
        begin
          shblk_2.Left := int_tiang - (shblk_2.Width div 2);
          Timer3.Enabled := true;
          Timer2.Enabled := False;
        end;
      end
      else if LeftStr(str_IsiB, 1) = '3' then
      begin
        shblk_3.Left := shblk_3.Left - 10;
        if (shblk_3.Left + (shblk_3.Width div 2)) < int_tiang then
        begin
          shblk_3.Left := int_tiang - (shblk_3.Width div 2);
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
    if (str_pindahke = 'B') then // jika dipindah keposisi B
    begin
      if Length(str_IsiB) = 0 then
        int_posisi := int_terbawah
      else if Length(str_IsiB) = 1 then
        int_posisi := int_tengah
      else if Length(str_IsiB) = 2 then
        int_posisi := int_teratas;
    end
    else if (str_pindahke = 'C') then
    begin
      if Length(str_IsiC) = 0 then
        int_posisi := int_terbawah
      else if Length(str_IsiC) = 1 then
        int_posisi := int_tengah
      else if Length(str_IsiC) = 2 then
        int_posisi := int_teratas;
    end;

    if LeftStr(str_IsiA, 1) = '1' then // jika isi A balok paling kecil teratas
    begin
      shblk_1.Top := shblk_1.Top + 10;
      if (shblk_1.Top + int_tinggiblk + int_jarak) > int_posisi then
      begin
        shblk_1.Top := int_posisi - int_tinggiblk - int_jarak;
        str_IsiA := StringReplace(str_IsiA, '1', '', [rfReplaceAll]);
        if str_pindahke = 'B' then
          str_IsiB := '1' + str_IsiB;
        if str_pindahke = 'C' then
          str_IsiC := '1' + str_IsiC;
        str_tiang := 'PILIHTIANG';
        sp_A.Enabled := true;
        sp_B.Enabled := true;
        sp_C.Enabled := true;
        Timer3.Enabled := False;
      end;
    end
    else if LeftStr(str_IsiA, 1) = '2' then
    begin
      shblk_2.Top := shblk_2.Top + 10;
      if (shblk_2.Top + int_tinggiblk + int_jarak) > int_posisi then
      begin
        shblk_2.Top := int_posisi - int_tinggiblk - int_jarak;
        str_IsiA := StringReplace(str_IsiA, '2', '', [rfReplaceAll]);
        if str_pindahke = 'B' then
          str_IsiB := '2' + str_IsiB;
        if str_pindahke = 'C' then
          str_IsiC := '2' + str_IsiC;
        str_tiang := 'PILIHTIANG';
        sp_A.Enabled := true;
        sp_B.Enabled := true;
        sp_C.Enabled := true;
        Timer3.Enabled := False;
        // cek
        if str_pindahke='B' then
         begin
          if Length(str_IsiB)> 1 then
          if (strtoint(LeftStr(str_IsiB,1))) > (strtoint(Copy(str_IsiB,2,1))) then
          begin
            ShowMessage('Salah !!! Yang kecil diatas. Saya Kembalikan lagi ke asal deh ');
            sp_BClick(Self);
            sp_AClick(Self);
          end;
          end
         else if str_pindahke='C' then
         begin
          if Length(str_IsiC)> 1 then
          if (strtoInt(LeftStr(str_IsiC,1))) > (strToInt(Copy(str_IsiC,2,1))) then
          begin
            ShowMessage('Salah !!! Yang kecil diatas. Saya Kembalikan lagi ke asal deh ');
            sp_CClick(Self);
            sp_AClick(Self);
          end;
         end;
        //end of cek
      end;
    end
    else if LeftStr(str_IsiA, 1) = '3' then
    begin
      shblk_3.Top := shblk_3.Top + 10;
      if (shblk_3.Top + int_tinggiblk + int_jarak) > int_posisi then
      begin
        shblk_3.Top := int_posisi - int_tinggiblk - int_jarak;
        str_IsiA := StringReplace(str_IsiA, '3', '', [rfReplaceAll]);
        if str_pindahke = 'B' then
          str_IsiB := '3' + str_IsiB;
        if str_pindahke = 'C' then
          str_IsiC := '3' + str_IsiC;
        str_tiang := 'PILIHTIANG';
        sp_A.Enabled := true;
        sp_B.Enabled := true;
        sp_C.Enabled := true;
        Timer3.Enabled := False;
        // cek
        if str_pindahke='B' then
         begin
          if Length(str_IsiB)> 1 then
          if (strtoint(LeftStr(str_IsiB,1))) > (strtoint(Copy(str_IsiB,2,1))) then
          begin
            ShowMessage('Salah !!! Yang kecil diatas. Saya Kembalikan lagi ke asal deh ');
            sp_BClick(Self);
            sp_AClick(Self);
          end;
          end
         else if str_pindahke='C' then
         begin
          if Length(str_IsiC)> 1 then
          if (strtoInt(LeftStr(str_IsiC,1))) > (strToInt(Copy(str_IsiC,2,1))) then
          begin
            ShowMessage('Salah !!! Yang kecil diatas. Saya Kembalikan lagi ke asal deh ');
            sp_CClick(Self);
            sp_AClick(Self);
          end;
         end;
        //end of cek
      end;
    end;

  end // end of poasisi A
  else if str_tiang = 'B' then // posisi B
  begin
    if str_pindahke = 'A' then // jika di pindah ke A
    begin
      if Length(str_IsiA) = 0 then
        int_posisi := int_terbawah
      else if Length(str_IsiA) = 1 then
        int_posisi := int_tengah
      else if Length(str_IsiA) = 2 then
        int_posisi := int_teratas;
    end
    else if (str_pindahke = 'C') then // jika dipindah ke C
    begin
      if Length(str_IsiC) = 0 then
        int_posisi := int_terbawah
      else if Length(str_IsiC) = 1 then
        int_posisi := int_tengah
      else if Length(str_IsiC) = 2 then
        int_posisi := int_teratas;
    end;

    if LeftStr(str_IsiB, 1) = '1' then // balok terkecil teratas
    begin
      shblk_1.Top := shblk_1.Top + 10;
      if (shblk_1.Top + int_tinggiblk + int_jarak) > int_posisi then
      begin
        shblk_1.Top := int_posisi - int_tinggiblk - int_jarak;
        str_IsiB := StringReplace(str_IsiB, '1', '', [rfReplaceAll]);
        if str_pindahke = 'A' then
          str_IsiA := '1' + str_IsiA;
        if str_pindahke = 'C' then
          str_IsiC := '1' + str_IsiC;
        str_tiang := 'PILIHTIANG';
        sp_A.Enabled := true;
        sp_B.Enabled := true;
        sp_C.Enabled := true;
        Timer3.Enabled := False;
      end;
    end
    else if LeftStr(str_IsiB, 1) = '2' then // balok ukuran sedang teratas
    begin
      shblk_2.Top := shblk_2.Top + 10;
      if (shblk_2.Top + int_tinggiblk + int_jarak) > int_posisi then
      begin
        shblk_2.Top := int_posisi - int_tinggiblk - int_jarak;
        str_IsiB := StringReplace(str_IsiB, '2', '', [rfReplaceAll]);
        if str_pindahke = 'A' then
          str_IsiA := '2' + str_IsiA;
        if str_pindahke = 'C' then
          str_IsiC := '2' + str_IsiC;
        str_tiang := 'PILIHTIANG';
        sp_A.Enabled := true;
        sp_B.Enabled := true;
        sp_C.Enabled := true;
        Timer3.Enabled := False;
        // cek
        if str_pindahke='A' then
         begin
          if Length(str_IsiA)> 1 then
          if (strtoint(LeftStr(str_IsiA,1))) > (strtoint(Copy(str_IsiA,2,1))) then
          begin
            ShowMessage('Salah !!! Yang kecil diatas. Saya Kembalikan lagi ke asal deh ');
            sp_AClick(Self);
            sp_BClick(Self);
          end;
          end
         else if str_pindahke='C' then
         begin
          if Length(str_IsiC)> 1 then
          if (strtoInt(LeftStr(str_IsiC,1))) > (strToInt(Copy(str_IsiC,2,1))) then
          begin
            ShowMessage('Salah !!! Yang kecil diatas. Saya Kembalikan lagi ke asal deh ');
            sp_CClick(Self);
            sp_BClick(Self);
          end;
         end;
        //end of cek

      end;
    end
    else if LeftStr(str_IsiB, 1) = '3' then // balok terbesar ukuran teratas
    begin
      shblk_3.Top := shblk_3.Top + 10;
      if (shblk_3.Top + int_tinggiblk + int_jarak) > int_posisi then
      begin
        shblk_3.Top := int_posisi - int_tinggiblk - int_jarak;
        str_IsiB := StringReplace(str_IsiB, '3', '', [rfReplaceAll]);
        if str_pindahke = 'A' then
          str_IsiA := '3' + str_IsiA;
        if str_pindahke = 'C' then
          str_IsiC := '3' + str_IsiC;
        str_tiang := 'PILIHTIANG';
        sp_A.Enabled := true;
        sp_B.Enabled := true;
        sp_C.Enabled := true;
        Timer3.Enabled := False;
        // cek
        if str_pindahke='A' then
         begin
          if Length(str_IsiA)> 1 then
          if (strtoint(LeftStr(str_IsiA,1))) > (strtoint(Copy(str_IsiA,2,1))) then
          begin
            ShowMessage('Salah !!! Yang kecil diatas. Saya Kembalikan lagi ke asal deh ');
            sp_AClick(Self);
            sp_BClick(Self);
          end;
          end
         else if str_pindahke='C' then
         begin
          if Length(str_IsiC)> 1 then
          if (strtoInt(LeftStr(str_IsiC,1))) > (strToInt(Copy(str_IsiC,2,1))) then
          begin
            ShowMessage('Salah !!! Yang kecil diatas. Saya Kembalikan lagi ke asal deh ');
            sp_CClick(Self);
            sp_BClick(Self);
          end;
         end;
        //end of cek
      end;
    end;
  end // end of posisi B
  else if str_tiang = 'C' then // posisi C
  begin
    if str_pindahke = 'A' then // jika dipindah ke A
    begin
      if Length(str_IsiA) = 0 then
        int_posisi := int_terbawah
      else if Length(str_IsiA) = 1 then
        int_posisi := int_tengah
      else if Length(str_IsiA) = 2 then
        int_posisi := int_teratas;
    end
    else if str_pindahke = 'B' then  // jika dipindah ke B
    begin
      if Length(str_IsiB) = 0 then
        int_posisi := int_terbawah
      else if Length(str_IsiB) = 1 then
        int_posisi := int_tengah
      else if Length(str_IsiB) = 2 then
        int_posisi := int_teratas;
    end;

    if LeftStr(str_IsiC, 1) = '1' then // balok terkecil
    begin
      shblk_1.Top := shblk_1.Top + 10;
      if (shblk_1.Top + int_tinggiblk + int_jarak) > int_posisi then
      begin
        shblk_1.Top := int_posisi - int_tinggiblk - int_jarak;
        str_IsiC := StringReplace(str_IsiC, '1', '', [rfReplaceAll]);
        if str_pindahke = 'B' then
          str_IsiB := '1' + str_IsiB;
        if str_pindahke = 'A' then
          str_IsiA := '1' + str_IsiA;
        str_tiang := 'PILIHTIANG';
        sp_A.Enabled := true;
        sp_B.Enabled := true;
        sp_C.Enabled := true;
        Timer3.Enabled := False;
      end;
    end
    else if LeftStr(str_IsiC, 1) = '2' then
    begin
      shblk_2.Top := shblk_2.Top + 10;
      if (shblk_2.Top + int_tinggiblk + int_jarak) > int_posisi then
      begin
        shblk_2.Top := int_posisi - int_tinggiblk - int_jarak;
        str_IsiC := StringReplace(str_IsiC, '2', '', [rfReplaceAll]);
        if str_pindahke = 'B' then
          str_IsiB := '2' + str_IsiB;
        if str_pindahke = 'A' then
          str_IsiA := '2' + str_IsiA;
        str_tiang := 'PILIHTIANG';
        sp_A.Enabled := true;
        sp_B.Enabled := true;
        sp_C.Enabled := true;
        Timer3.Enabled := False;
        // cek
        if str_pindahke='A' then
         begin
          if Length(str_IsiA)> 1 then
          if (strtoint(LeftStr(str_IsiA,1))) > (strtoint(Copy(str_IsiA,2,1))) then
          begin
            ShowMessage('Salah !!! Yang kecil diatas. Saya Kembalikan lagi ke asal deh ');
            sp_AClick(Self);
            sp_CClick(Self);
          end;
          end
         else if str_pindahke='B' then
         begin
          if Length(str_IsiB)> 1 then
          if (strtoInt(LeftStr(str_IsiB,1))) > (strToInt(Copy(str_IsiB,2,1))) then
          begin
            ShowMessage('Salah !!! Yang kecil diatas. Saya Kembalikan lagi ke asal deh ');
            sp_BClick(Self);
            sp_CClick(Self);
          end;
         end;
        //end of cek
      end;
    end
    else if LeftStr(str_IsiC, 1) = '3' then
    begin
      shblk_3.Top := shblk_3.Top + 10;
      if (shblk_3.Top + int_tinggiblk + int_jarak) > int_posisi then
      begin
        shblk_3.Top := int_posisi - int_tinggiblk - int_jarak;
        str_IsiC := StringReplace(str_IsiC, '3', '', [rfReplaceAll]);
        if str_pindahke = 'B' then
          str_IsiB := '3' + str_IsiB;
        if str_pindahke = 'A' then
          str_IsiA := '3' + str_IsiA;
        str_tiang := 'PILIHTIANG';
        sp_A.Enabled := true;
        sp_B.Enabled := true;
        sp_C.Enabled := true;
        Timer3.Enabled := False;
                // cek
        if str_pindahke='A' then
         begin
          if Length(str_IsiA)> 1 then
          if (strtoint(LeftStr(str_IsiA,1))) > (strtoint(Copy(str_IsiA,2,1))) then
          begin
            ShowMessage('Salah !!! Yang kecil diatas. Saya Kembalikan lagi ke asal deh ');
            sp_AClick(Self);
            sp_CClick(Self);
          end;
          end
         else if str_pindahke='B' then
         begin
          if Length(str_IsiB)> 1 then
          if (strtoInt(LeftStr(str_IsiB,1))) > (strToInt(Copy(str_IsiB,2,1))) then
          begin
            ShowMessage('Salah !!! Yang kecil diatas. Saya Kembalikan lagi ke asal deh ');
            sp_BClick(Self);
            sp_CClick(Self);
          end;
         end;
        //end of cek
      end;
    end;
  end; // end of C
end;

end.
