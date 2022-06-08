import { prisma } from '../prisma-client'
import {Request, Response} from 'express';

export const getRespirators = async (req: Request, res: Response): Promise<void> => {
    const respirators = await prisma.respirator.findMany();
    res.json(respirators);
}